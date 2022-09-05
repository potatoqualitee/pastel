@{
    Verb                    = "Write"
    Noun                    = "PastelColoredText"
    OriginalName            = "pastel"
    OriginalCommandElements = "paint"
    Synopsis                = "Print colored text using ANSI escape sequences"
    Description             = "Print colored text using ANSI escape sequences"
    Parameters              =
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
        ValueFromPipeline               = $false
        ValueFromPipelineByPropertyName = $true
        Position                        = 0
        OriginalPosition                = 5
        Mandatory                       = $true
        ParameterSetName                = "Default"
    },
    @{
        ParameterType     = "string"
        Name              = "Text"
        Description       = "The text to be printed in color. If no argument is given, the input is read from STDIN"
        ValueFromPipeline = $true
        Mandatory         = $false
        Position          = 1
        OriginalPosition  = 6
        ParameterSetName  = "Default"
    },
    @{
        ParameterType                   = "string"
        Name                            = "BackgroundColor"
        OriginalName                    = '--on'
        Description                     = "Use the specified background color"
        Mandatory                       = $false
        ValueFromPipeline               = $false
        ValueFromPipelineByPropertyName = $true
        Position                        = 2
        OriginalPosition                = 0
        ParameterSetName                = "Default"
    },
    @{
        ParameterType                   = "switch"
        Name                            = "Bold"
        OriginalName                    = '--bold'
        Description                     = "Print the text in bold face"
        Mandatory                       = $false
        ValueFromPipeline               = $false
        ValueFromPipelineByPropertyName = $true
        Position                        = 3
        OriginalPosition                = 1
        ParameterSetName                = "Default"
    },
    @{
        ParameterType                   = "switch"
        Name                            = "Underline"
        OriginalName                    = '--underline'
        Description                     = "Draw a line below the text"
        Mandatory                       = $false
        ValueFromPipeline               = $false
        ValueFromPipelineByPropertyName = $true
        Position                        = 4
        OriginalPosition                = 2
        ParameterSetName                = "Default"
    },
    @{
        ParameterType                   = "switch"
        Name                            = "Italic"
        OriginalName                    = '--italic'
        Description                     = "Print the text in italic font"
        Mandatory                       = $false
        ValueFromPipeline               = $false
        ValueFromPipelineByPropertyName = $true
        Position                        = 5
        OriginalPosition                = 3
        ParameterSetName                = "Default"
    },
    @{
        ParameterType                   = "switch"
        Name                            = "NoNewLine"
        OriginalName                    = '--no-newline'
        Description                     = "Do not print a trailing newline character"
        Mandatory                       = $false
        ValueFromPipeline               = $false
        ValueFromPipelineByPropertyName = $true
        Position                        = 6
        OriginalPosition                = 4
        ParameterSetName                = "Default"
    }
    Examples                = @{
        Command         = "Write-PastelColoredText -Color blue -Text sup -BackgroundColor white"
        OriginalCommand = "pastel paint blue --on white sup"
        Description     = "Prints 'sup' in blue on a white background"
    },
    @{
        Command         = "Write-PastelColoredText -Color blue -Text sup -BackgroundColor white -Underline -Bold -Italic -Verbose"
        OriginalCommand = "pastel paint 'rgb(0, 128, 0)' --on white --underline --bold --italic sup"
        Description     = "Prints an underlined, bold and italic 'sup' in blue on a white background"
    },
    @{
        Command         = "Write-PastelColoredText -Color 'rgb(0, 128, 0)' -Text sup -BackgroundColor white -Underline -Bold -Italic -Verbose"
        OriginalCommand = "pastel paint 'rgb(0, 128, 0)' --on white --underline --bold --italic sup"
        Description     = "Prints an underlined, bold and italic 'sup' in rgb(0, 128, 0) on a white background"
    }
    OutputHandlers          = @{
        ParameterSetName = "Default"
        Handler          = { $true }
        HandlerType      = "Inline"
        StreamOutput     = $false
    }
    HelpLinks               = "https://github.com/sharkdp/pastel"
}