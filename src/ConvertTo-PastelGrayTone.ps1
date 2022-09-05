@{
    Verb                    = "ConvertTo"
    Noun                    = "PastelGrayTone"
    OriginalName            = "pastel"
    OriginalCommandElements = "to-gray"
    Synopsis                = "Completely desaturate a color (preserving luminance)"
    Description             = "Completely desaturate the given color while preserving the luminance."
    Parameters              = 
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
        Mandatory                       = $true
        ValueFromPipeline               = $true
        ValueFromPipelineByPropertyName = $true
        Position                        = 1
        OriginalPosition                = 1
        ParameterSetName                = "Default"
    }
    Examples                = @{
        Command         = "ConvertTo-PastelGrayTone -Color blue"
        OriginalCommand = "pastel to-gray blue"
        Description     = "Converts the color blue to a gray tone"
    }
    OutputHandlers          = @{
        ParameterSetName = "Default"
        Handler          = { $true }
        HandlerType      = "Inline"
        StreamOutput     = $false
    }
    HelpLinks               = "https://github.com/sharkdp/pastel"
}