@{
    Verb                    = "Edit"
    Noun                    = "PastelColorProperty"
    OriginalName            = "pastel"
    OriginalCommandElements = "set"
    Synopsis                = "Set the given property to a specific value"
    Description             = "Set the given property to a specific value"
    Parameters              = 
    @{
        ParameterType                   = "string"
        Name                            = "Property"
        Description                     = "The property that should be changed [possible values: lightness, hue, chroma, lab-a, lab-b, red, green, blue, hsl-hue, hsl-saturation, hsl-lightness]"
        AdditionalParameterAttributes   = '[ValidateSet("lightness", "hue", "chroma", "lab-a", "lab-b", "red", "green", "blue", "hsl-hue", "hsl-saturation", "hsl-lightness")]'
        ValueFromPipeline               = $false
        ValueFromPipelineByPropertyName = $true
        Mandatory                       = $true
        Position                        = 0
        OriginalPosition                = 0
        ParameterSetName                = "Default"
    },
    @{
        ParameterType                   = "decimal"
        Aliases                         = "Value"
        Name                            = "NewValue"
        Description                     = "The new numerical value of the property"
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
        Command         = "Edit-PastelColorProperty -Property lightness -Value 1 -Color red"
        OriginalCommand = "pastel set lightness 1 red"
        Description     = "Increase the lightness of the color red by 1"
    },
    @{
        Command         = "Edit-PastelColorProperty -Property hue -Value 10 -Color f5ee92"
        OriginalCommand = "pastel set hue 10 f5ee92"
        Description     = "Increases the hue of the color f5ee92 by 10"
    }
    OutputHandlers          = @{
        ParameterSetName = "Default"
        Handler          = { $true }
        HandlerType      = "Inline"
        StreamOutput     = $false
    }
    HelpLinks               = "https://github.com/sharkdp/pastel"
}