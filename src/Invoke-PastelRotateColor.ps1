@{
    Verb                    = "Invoke"
    Noun                    = "PastelRotateColor"
    OriginalName            = "pastel"
    OriginalCommandElements = "rotate"
    Synopsis                = "Rotate the hue channel by the specified angle"
    Description             = "Rotate the HSL hue channel of a color by the specified angle (in degrees). A rotation by 180° returns the complementary color. A rotation by 360° returns to the original color."
    Parameters              = 
    @{
        ParameterType                   = "decimal"
        Aliases                         = "Value"
        Name                            = "Degree"
        Description                     = "Angle by which to rotate (in degrees, can be negative)"
        ValueFromPipeline               = $false
        ValueFromPipelineByPropertyName = $true
        Position                        = 1
        OriginalPosition                = 1
        ParameterSetName                = "Default"
    },
    @{
        ParameterType                   = "string[]"
        Name                            = "Color"
        Description                     = "Colors can be specified in many different formats, such as #RRGGBB, RRGGBB, #RGB, 'rgb(…, …, …)', 'hsl(…, …, …)', 'gray(…)' or simply by the name of the color. The identifier '-' can be used to read a single color from standard input. Also, the special identifier 'pick' can be used to run an external color picker to choose a color. If no color argument is specified, colors will be read from standard input.
            Examples (all of these specify the same color):
              - lightslategray
              - '#778899'
              - 778899
              - 789
              - 'rgb(119, 136, 153)'
              - '119,136,153'
              - 'hsl(210, 14.3%, 53.3%)'
            Alpha transparency is also supported:
              - '#77889980'
              - 'rgba(119, 136, 153, 0.5)'
              - 'hsla(210, 14.3%, 53.3%, 50%)'"
        ValueFromPipeline               = $true
        ValueFromPipelineByPropertyName = $true
        Position                        = 2
        OriginalPosition                = 2
        ParameterSetName                = "Default"
    }
    Examples                = @{
        Command         = "Invoke-PastelRotateColor -Degree 180 -Color red"
        OriginalCommand = "pastel rotate 180 red"
        Description     = "Rotate the hue of the color red by 180°"
    }
    OutputHandlers          = @{
        ParameterSetName = "Default"
        Handler          = { $true }
        HandlerType      = "Inline"
        StreamOutput     = $false
    }
    HelpLinks               = "https://github.com/sharkdp/pastel"
}