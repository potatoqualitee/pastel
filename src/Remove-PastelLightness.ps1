@{
    Verb                    = "Remove"
    Noun                    = "PastelLightness"
    OriginalName            = "pastel"
    OriginalCommandElements = "darken"
    Synopsis                = "Darken color by a specified amount"
    Description             = "Darken a color by subtracting a certain amount from the lightness channel. If the amount is negative, the color will be lightened."
    Parameters              = @{
        ParameterType                   = "decimal"
        Name                            = "Amount"
        Description                     = "Amount of lightness to subtract (number between 0.0 and 1.0)"
        ValueFromPipeline               = $false
        ValueFromPipelineByPropertyName = $true
        AdditionalParameterAttributes   = '[ValidateRange(0, 1)]'
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
        Mandatory                       = $true
        ValueFromPipeline               = $true
        ValueFromPipelineByPropertyName = $true
        Position                        = 1
        OriginalPosition                = 1
        ParameterSetName                = "Default"
    }
    Examples                = @{
        Command         = "Remove-PastelLightness -Amount 0.1 -Color red"
        OriginalCommand = "pastel darken 0.1 red"
        Description     = "Darkens of the color red by 10%"
    }
    OutputHandlers          = @{
        ParameterSetName = "Default"
        Handler          = { $true }
        HandlerType      = "Inline"
        StreamOutput     = $false
    }
    HelpLinks               = "https://github.com/sharkdp/pastel"
}