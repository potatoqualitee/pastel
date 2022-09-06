@{
    Verb                    = "New"
    Noun                    = "PastelGrayTone"
    OriginalName            = "pastel"
    OriginalCommandElements = "gray"
    Synopsis                = "Create a gray tone from a given lightness value."
    Description             = "Create a gray tone from a given lightness value."
    Parameters              = @{
        ParameterType                   = "decimal"
        Name                            = "Lightness"
        Description                     = "Lightness of the created gray tone (number between 0.0 and 1.0)"
        ValueFromPipeline               = $true
        ValueFromPipelineByPropertyName = $true
        AdditionalParameterAttributes   = '[ValidateRange(0, 1)]'
        Position                        = 0
        OriginalPosition                = 0
        ParameterSetName                = "Default"
    }
    Examples                = @{
        Command         = "New-PastelGrayTone -Lightness 0.1"
        OriginalCommand = "pastel gray 0.1"
        Description     = "Create a gray tone with a lightness of 0.1"
    },
    @{
        Command         = "New-PastelGrayTone -Lightness 1.0"
        OriginalCommand = "pastel gray 1"
        Description     = "Create a gray tone with a lightness of 1.0"
    }
    OutputHandlers          = @{
        ParameterSetName = "Default"
        Handler          = { $true }
        HandlerType      = "Inline"
        StreamOutput     = $false
    }
    HelpLinks               = "https://github.com/sharkdp/pastel"
}