module Gruvbox

using Makie, Colors

export color_gruvbox_light, color_gruvbox_dark

const gruvbox_dark_palette = Dict(
    :bg => "#282828",
    :red => "#cc241d",
    :green => "#98971a",
    :yellow => "#d79921",
    :blue => "#458588",
    :purple => "#b16286",
    :aqua => "#689d6a",
    :gray => "#a89984",

    :gray_hi => "#928374",
    :red_hi => "#fb4934",
    :green_hi => "#b8bb26",
    :yellow_hi => "#fabd2f",
    :blue_hi => "#83a598",
    :purple_hi => "#d3869b",
    :aqua_hi => "#8ec07c",
    :fg => "#ebdbb2",

    :bg0_h => "#1d2021",
    :bg0 => "#282828",
    :bg1 => "#3c3836",
    :bg2 => "#504945",
    :bg3 => "#665c54",
    :bg4 => "#7c6f64",
    :gray_alt => "#928374",
    :orange => "#d65d0e",

    :bg0_s => "#32302f",
    :fg4 => "#a89984",
    :fg3 => "#bdae93",
    :fg2 => "#d5c4a1",
    :fg1 => "#ebdbb2",
    :fg0 => "#fbf1c7",
    :orange_hi => "#fe8019"
)

const gruvbox_light_palette = Dict(
    :bg => "#fbf1c7",
    :red => "#cc241d",
    :green => "#98971a",
    :yellow => "#d79921",
    :blue => "#458588",
    :purple => "#b16286",
    :aqua => "#689d6a",
    :gray => "#7c6f64",

    :gray_hi => "#928374",
    :red_hi => "#9d0006",
    :green_hi => "#79740e",
    :yellow_hi => "#b57614",
    :blue_hi => "#076678",
    :purple_hi => "#8f3f71",
    :aqua_hi => "#427b58",
    :fg => "#3c3836",

    :bg0_h => "#f9f5d7",
    :bg0 => "#fbf1c7",
    :bg1 => "#ebdbb2",
    :bg2 => "#d5c4a1",
    :bg3 => "#bdae93",
    :bg4 => "#a89984",
    :gray_alt => "#928374",
    :orange => "#d65d0e",

    :bg0_s => "#f2e5bc",
    :fg4 => "#7c6f64",
    :fg3 => "#665c54",
    :fg2 => "#504945",
    :fg1 => "#3c3836",
    :fg0 => "#282828",
    :orange_hi => "#af3a03"
)

function color_gruvbox(palette; use_alt_bg=true)
    fg = parse(Colorant, palette[:fg])
    fg_alt = parse(Colorant, palette[:fg4])
    bg = parse(Colorant, palette[:bg])
    bg_alt = parse(Colorant, palette[use_alt_bg ? :bg1 : :bg])

    color_cycle = [parse(Colorant, palette[c])
                  for c in [
                      :red,
                      :green,
                      :yellow,
                      :blue,
                      :purple,
                      :aqua,
                      :red_hi,
                      :green_hi,
                      :yellow_hi,
                      :blue_hi,
                      :purple_hi,
                      :aqua_hi,
                  ]]

    palettes = merge(
      Attributes(
        color = color_cycle,
        patchcolor = RGBA.(color_cycle, 0.8),
      ),
      Makie.DEFAULT_PALETTES,
    )

    Attributes(
        color = fg,
        textcolor = fg,
        backgroundcolor = bg,
        palette = palettes,
        Axis = (
            backgroundcolor = bg_alt,
            titlecolor = fg,
            subtitlecolor = fg,
            topspinecolor = fg,
            bottomspinecolor = fg,
            leftspinecolor = fg,
            rightspinecolor = fg,
            xgridcolor = fg_alt,
            ygridcolor = fg_alt,
            xminorgridcolor = fg_alt,
            yminorgridcolor = fg_alt,
            xtickcolor = fg,
            ytickcolor = fg,
        ),
        Axis3 = (
            backgroundcolor = bg_alt,
            xypanelcolor = bg_alt,
            xzpanelcolor = bg_alt,
            yzpanelcolor = bg_alt,
            titlecolor = fg,
            subtitlecolor = fg,
            xspinecolor_1 = fg,
            xspinecolor_2 = fg,
            xspinecolor_3 = fg,
            yspinecolor_1 = fg,
            yspinecolor_2 = fg,
            yspinecolor_3 = fg,
            zspinecolor_1 = fg,
            zspinecolor_2 = fg,
            zspinecolor_3 = fg,
            xgridcolor = fg_alt,
            ygridcolor = fg_alt,
            zgridcolor = fg_alt,
            xtickcolor = fg,
            ytickcolor = fg,
            ztickcolor = fg,
        ),
        Colorbar = (
            backgroundcolor = bg_alt,
            topspinecolor = fg,
            bottomspinecolor = fg,
            leftspinecolor = fg,
            rightspinecolor = fg,
            tickcolor = fg,
            minortickcolor = fg_alt,
            labelcolor = fg,
        ),
        Legend = (
            framecolor = fg,
            backgroundcolor = bg_alt,
        )
    )
end

color_gruvbox_light(;kwargs...) =
    color_gruvbox(gruvbox_light_palette; kwargs...)

color_gruvbox_dark(;kwargs...) =
    color_gruvbox(gruvbox_dark_palette; kwargs...)

end