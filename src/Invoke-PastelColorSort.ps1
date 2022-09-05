@{
    Verb                    = "Invoke"
    Noun                    = "PastelColorSort"
    OriginalName            = "pastel"
    OriginalCommandElements = "sort-by"
    Synopsis                = "Sort colors by the given property"
    Description             = "Sort colors by the given property"
    Parameters              = 
    @{
        ParameterType                   = "switch"
        Name                            = "Reverse"
        OriginalName                    = '--reverse'
        Description                     = "Reverse the sort order"
        ValueFromPipeline               = $false
        ValueFromPipelineByPropertyName = $true
        Position                        = 0
        ParameterSetName                = "Default"
    },
    @{
        ParameterType                   = "switch"
        Name                            = "Unique"
        OriginalName                    = '--unique'
        Description                     = "Remove duplicate colors (equality is determined via RGB values)"
        ValueFromPipeline               = $false
        ValueFromPipelineByPropertyName = $true
        Position                        = 1
        ParameterSetName                = "Default"
    },
    @{
        ParameterType                   = "string"
        Name                            = "OrderBy"
        Description                     = "Sort order [default: hue] [possible values: brightness, luminance, hue, chroma, random]"
        AdditionalParameterAttributes   = '[ValidateSet("brightness", "luminance", "hue", "chroma", "random")]'
        ValueFromPipelineByPropertyName = $true
        Mandatory                       = $true
        Position                        = 2
        ParameterSetName                = "Default"
    },
    @{
        ParameterType                   = "string[]"
        Name                            = "Color"
        Description                     = "Colors can be specified in many different formats, such as #RRGGBB, RRGGBB, #RGB,
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
        Mandatory                       = $true
        ParameterSetName                = "Default"
    }
    Examples                = @{
        Command         = "Invoke-PastelColorSort -Order hue -Color white black"
        OriginalCommand = "pastel sort-by hue white black"
        Description     = "Sort colors by hue"
    },
    @{
        Command         = "Invoke-PastelColorSort -Order chroma -Color 0000ff 'rgba(119, 136, 153, 0.5)'"
        OriginalCommand = "pastel sort-by chroma 0000ff --unique rgba(119, 136, 153, 0.5)"
        Description     = "Sort 0000ff and rgba(119, 136, 153, 0.5) by chroma"
    },
    @{
        Command         = "Invoke-PastelColorSort -Order luminance -Color red, blue, green"
        OriginalCommand = "pastel sort-by luminance red blue green"
        Description     = "Sort red blue and green by luminance"
    }
    OutputHandlers          = @{
        ParameterSetName = "Default"
        Handler          = { $true }
        HandlerType      = "Inline"
        StreamOutput     = $false
    }
    HelpLinks               = "https://github.com/sharkdp/pastel"
}