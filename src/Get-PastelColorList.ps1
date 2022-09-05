@{
    Verb                    = "Get"
    Noun                    = "PastelColorList"
    OriginalName            = "pastel"
    OriginalCommandElements = "list"
    Synopsis                = "Show a list of available color names"
    Description             = "Show a list of available color names"
    Parameters              = @{
        ParameterType                   = "string"
        Name                            = "Sort"
        OriginalName                    = '--sort'
        Description                     = "Sort order [default: hue] [possible values: brightness, luminance, hue, chroma, random]"
        Mandatory                       = $false
        ValueFromPipeline               = $true
        ValueFromPipelineByPropertyName = $true
        DefaultValue                    = "hue"
        DefaultMissingValue             = "hue"
        AdditionalParameterAttributes   = '[ValidateSet("brightness", "luminance", "hue", "chroma", "random")]'
        Position                        = 0
        OriginalPosition                = 0
        ParameterSetName                = "Default"
    }
    Examples                = @{
        Command         = "Get-PastelColorList"
        OriginalCommand = "pastel list"
        Description     = "Shows a list of available color names"
    },
    @{
        Command         = "Get-PastelColorList -Sort hue"
        OriginalCommand = "pastel list --sort hue"
        Description     = "Shows a list of available color names sorted by hue"
    }
    OutputHandlers          = @{
        ParameterSetName = "Default"
        Handler          = {$true}
        HandlerType      = "Inline"
        StreamOutput     = $false
    }
    HelpLinks               = "https://github.com/sharkdp/pastel"
}