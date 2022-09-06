@{
    Verb                    = "Show"
    Noun                    = "PastelGradient"
    OriginalName            = "pastel"
    OriginalCommandElements = "gradient"
    Synopsis                = "Generate a sequence of colors that interpolates between the specified colors. The interpolation is performed in the specified color space."
    Description             = "Generate a sequence of colors that interpolates between the specified colors. The interpolation is performed in the specified color space."
    Parameters              = 
    @{
        ParameterType                   = "int"
        Name                            = "Number"
        OriginalName                    = '--number'
        Description                     = "Number of colors to generate"
        ValueFromPipeline               = $false
        ValueFromPipelineByPropertyName = $true
        Position                        = 0
        OriginalPosition                = 0
        ParameterSetName                = "Default"
    },
    @{
        ParameterType                   = "string"
        Name                            = "ColorSpace"
        OriginalName                    = '--colorspace'
        Description                     = "The colorspace in which to interpolate [default: Lab] [possible values: Lab, LCh, RGB, HSL]"
        ValueFromPipeline               = $false
        ValueFromPipelineByPropertyName = $true
        AdditionalParameterAttributes   = '[ValidateSet("Lab", "LCh", "RGB", "HSL")]'
        Position                        = 1
        OriginalPosition                = 1
        Default                         = "Lab"
        DefaultMissingValue             = "Lab"
        ParameterSetName                = "Default"
    },
    @{
        ParameterType                   = "string"
        Name                            = "Color1"
        OriginalName                    = ''
        Description                     = " Color stops in the color gradient. Colors can be specified in many different formats, such as #RRGGBB, RRGGBB, #RGB,
            'rgb(…, …, …)', 'hsl(…, …, …)', 'gray(…)' or simply by the name of the color. The
            identifier '-' can be used to read a single color from standard input. Also, the special            identifier 'pick' can be used to run an external color picker to choose a color. If no
            color argument is specified, colors will be read from standard input.
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
    },
    @{
        ParameterType                   = "string"
        Name                            = "Color2"
        OriginalName                    = ''
        Description                     = " Color stops in the color gradient. Colors can be specified in many different formats, such as #RRGGBB, RRGGBB, #RGB,
            'rgb(…, …, …)', 'hsl(…, …, …)', 'gray(…)' or simply by the name of the color. The
            identifier '-' can be used to read a single color from standard input. Also, the special            identifier 'pick' can be used to run an external color picker to choose a color. If no
            color argument is specified, colors will be read from standard input.
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
        Position                        = 3
        OriginalPosition                = 3
        ParameterSetName                = "Default"
    }
    Examples                = @{
        Command         = "Show-PastelGradient -Number 5 -ColorSpace HSL -Color1 '#ffffcc' -Color2 '#fd8d3c'"
        OriginalCommand = "pastel gradient --colorspace=HSL ffffcc fd8d3c"
        Description     = "Generate a sequence of colors that interpolates between ffffcc and fd8d3c."
    },
    @{
        Command         = "Show-PastelGradient -ColorSpace RGB ffffcc fd8d3c"
        OriginalCommand = "pastel gradient --colorspace=RGB ffffcc fd8d3c"
        Description     = "Generate a sequence of colors that interpolates between ffffcc and fd8d3c."
    }
    OutputHandlers          = @{
        ParameterSetName = "Default"
        Handler          = { $true }
        HandlerType      = "Inline"
        StreamOutput     = $false
    }
    HelpLinks               = "https://github.com/sharkdp/pastel"
}