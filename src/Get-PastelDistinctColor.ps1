@{
    Verb                    = "Get"
    Noun                    = "PastelDistinctColor"
    OriginalName            = "pastel"
    OriginalCommandElements = "distinct"
    Synopsis                = "Generate a set of visually distinct color"
    Description             = "Generate a set of visually distinct colors by maximizing the perceived color difference between pairs of colors.

The default parameters for the optimization procedure (simulated annealing) should work fine for up to 10-20 colors."
    Parameters              = 
    @{
        ParameterType                   = "string"
        Name                            = "Metric"
        OriginalName                    = '--metric'
        Description                     = "Distance metric to compute mutual color distances. The CIEDE2000 is more accurate, but also much slower."
        ValueFromPipeline               = $false
        ValueFromPipelineByPropertyName = $true
        AdditionalParameterAttributes   = '[ValidateSet("CIEDE2000", "CIE76")]'
        Position                        = 0
        OriginalPosition                = 0
        ParameterSetName                = "Default"
    },
    @{
        ParameterType                   = "int"
        Name                            = "Count"
        OriginalName                    = ''
        Description                     = "Number of distinct colors in the set. Default is 10."
        ValueFromPipeline               = $false
        ValueFromPipelineByPropertyName = $true
        Position                        = 1
        OriginalPosition                = 1
        ParameterSetName                = "Default"
    },
    @{
        ParameterType                   = "string"
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
        Command         = "Get-PastelDistinctColor"
        OriginalCommand = "pastel distinct"
        Description     = "Generates a list of distinct colors"
    },
    @{
        Command         = "Get-PastelDistinctColor -Color lightslategray -Count 5"
        OriginalCommand = "pastel distinct --color lightslategray --count 5"
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