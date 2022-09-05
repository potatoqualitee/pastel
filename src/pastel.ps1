
@{
    Verb                    = "Get"
    Noun                    = "PastelColorInfo"
    OriginalName            = "pastel"
    OriginalCommandElements = "color"
    Synopsis                = "Get information about a color."
    Description             = "Get information about a color."
    Parameters              = @{
        ParameterType                   = "string"
        Name                            = "Color"
        Description                     = "Show and display some information about the given color(s)."
        Mandatory                       = "True"
        ValueFromPipeline               = "True"
        ValueFromPipelineByPropertyName = "True"
        Position                        = 0
        ParameterSetName                = "Default"
    }
    Examples = @{
        Command         = "Get-PastelColorInfo -Color blue"
        OriginalCommand = "patel color blue"
        Description     = "Show and display some information about the given color(s)"
    }
    OutputHandlers          = @{
        ParameterSetName = "Default"
        Handler          = {$true}
        HandlerType      = "Inline"
        StreamOutput     = $false
    }
    HelpLinks               = "https://github.com/sharkdp/pastel"
}