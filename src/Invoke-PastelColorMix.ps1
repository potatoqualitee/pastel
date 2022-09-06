@{
    Verb                    = "Invoke"
    Noun                    = "PastelColorMix"
    OriginalName            = "pastel"
    OriginalCommandElements = "mix"
    Synopsis                = "Mix two colors in the given colorspace"
    Description             = "Create new colors by interpolating between two colors in the given colorspace"
    Parameters              = 
    @{
        ParameterType                   = "decimal"
        Name                            = "fraction"
        OriginalName                    = '--fraction'
        Description                     = "The number between 0.0 and 1.0 determining how much to mix in from the base color. Default is 0.5"
        ValueFromPipeline               = $false
        ValueFromPipelineByPropertyName = $true
        Default                         = "0.5"
        DefaultMissingValue             = "0.5"
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
    },
    @{
        ParameterType                   = "string"
        Name                            = "Color2"
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
        Position                        = 3
        OriginalPosition                = 3
        ParameterSetName                = "Default"
    }
    Examples                = @{
        Command         = "Invoke-PastelColorMix -ColorSpace RGB -Color1 red -Color2 blue"
        OriginalCommand = "pastel mix --colorspace=RGB red blue"
        Description     = "Generate a sequence of colors that interpolates between ffffcc and fd8d3c."
    },
    @{
        Command         = "Invoke-PastelColorMix -ColorSpace RGB ffffcc fd8d3c"
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