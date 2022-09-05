@{
    Verb                    = "New"
    Noun                    = "PastelRandomColor"
    OriginalName            = "pastel"
    OriginalCommandElements = "random"
    Aliases                 = "Get-PastelRandomColor"
    Synopsis                = "Generate a list of random colors"
    Description             = "Generate a list of random colors"
    Parameters              = @{
        ParameterType                   = "string"
        Name                            = "Strategy"
        OriginalName                    = '--strategy'
        Description                     = "Randomization strategy:
               vivid:    random hue, limited saturation and lightness values
               rgb:      samples uniformly in RGB space
               gray:     random gray tone (uniform)
               lch_hue:  random hue, fixed lightness and chroma"
        ValueFromPipeline               = "True"
        ValueFromPipelineByPropertyName = "True"
        AdditionalParameterAttributes   = '[ValidateSet("vivid", "rgb", "gray", "lch_hue")]'
        Position                        = 0
        ParameterSetName                = "Default"
    },
    @{
        ParameterType                   = "int"
        Name                            = "Number"
        OriginalName                    = '--number'
        Description                     = "Number of colors to generate. Default is 10."
        ValueFromPipeline               = "False"
        ValueFromPipelineByPropertyName = "True"
        Position                        = 1
        ParameterSetName                = "Default"
    }
    Examples                = @{
        Command         = "New-PastelRandomColor"
        OriginalCommand = "pastel random"
        Description     = "Generate a list of random colors"
    },
    @{
        Command         = "New-PastelRandomColor -Strategy vivid -Number 5"
        OriginalCommand = "pastel random --strategy vivid --number 5"
        Description     = "Generate a list of 5 vivid colors"
    }
    OutputHandlers          = @{
        ParameterSetName = "Default"
        Handler          = { $true }
        HandlerType      = "Inline"
        StreamOutput     = $false
    }
    HelpLinks               = "https://github.com/sharkdp/pastel"
}