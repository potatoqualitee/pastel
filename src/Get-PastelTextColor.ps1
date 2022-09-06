
@{
    Verb                    = "Get"
    Noun                    = "PastelTextColor"
    OriginalName            = "pastel"
    OriginalCommandElements = "textcolor"
    Synopsis                = "Get a readable text color for the given background color"
    Description             = "Return a readable foreground text color (either black or white) for a given background color. This can also be used in the opposite way, i.e. to create a background color for a given text color."
    Parameters              = @{
        ParameterType                   = "string[]"
        Name                            = "Color"
        Description                     = "Show and display some information about the given color(s). Colors can be specified in many different formats, such as #RRGGBB, RRGGBB, #RGB, 'rgb(…, …, …)', 'hsl(…, …, …)', 'gray(…)' or simply by the name of the color. The identifier '-' can be used to read a single color from standard input. Also, the special identifier 'pick' can be used to run an external color picker to choose a color. If no color argument is specified, colors will be read from standard input.
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
        Position                        = 0
        OriginalPosition                = 0
        ParameterSetName                = "Default"
    }
    Examples                = @{
        Command         = "Get-PastelTextColor -Color blue"
        OriginalCommand = "pastel textcolor blue"
        Description     = "Get a readable text color for the given blue background color"
    }
    OutputHandlers          = @{
        ParameterSetName = "Default"
        Handler          = { $true }
        HandlerType      = "Inline"
        StreamOutput     = $false
    }
    HelpLinks               = "https://github.com/sharkdp/pastel"
}