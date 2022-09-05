@{
    Verb                    = "ConvertTo"
    Noun                    = "PastelColorBlind"
    OriginalName            = "pastel"
    OriginalCommandElements = "colorblind"
    Synopsis                = "Simulate a color under a certain colorblindness profile"
    Description             = "Convert the given color to how it would look to a person with protanopia, deuteranopia, or tritanopia"
    Parameters              = 
    @{
        ParameterType                   = "string"
        Name                            = "Type"
        Description                     = "The type of colorblindness that should be simulated (protanopia, deuteranopia, tritanopia)"
        AdditionalParameterAttributes   = '[ValidateSet("prot", "deuter", "trit")]'
        ValueFromPipelineByPropertyName = $false
        Mandatory                       = $false
        DefaultValue                    = "prot"
        DefaultMissingValue             = "prot"
        Position                        = 0
        OriginalPosition                = 0
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
        Position                        = 1
        OriginalPosition                = 1
        Mandatory                       = $true
        ParameterSetName                = "Default"
    }
    Examples                = @{
        Command         = "ConvertTo-PastelColorBlind -Type prot -Color '#FF0000', '#00FF00', '#0000FF'"
        OriginalCommand = "pastel colorblind prot #FF0000 #00FF00 #0000FF"
        Description     = "Simulate 3 colors to the protanopia colorblindness"
    }
    OutputHandlers          = @{
        ParameterSetName = "Default"
        Handler          = { $true }
        HandlerType      = "Inline"
        StreamOutput     = $false
    }
    HelpLinks               = "https://github.com/sharkdp/pastel"
}