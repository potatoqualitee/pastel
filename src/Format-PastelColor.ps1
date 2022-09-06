@{
    Verb                    = "Format"
    Noun                    = "PastelColor"
    OriginalName            = "pastel"
    OriginalCommandElements = "format"
    Synopsis                = "Convert the given color(s) to a specific format"
    Description             = "Convert the given color(s) to a specific format"
    Parameters              = 
    @{
        ParameterType                   = "string"
        Name                            = "Type"
        Description                     = "Output format type. Note that the 'ansi-*-escapecode' formats print ansi escape sequences to the terminal that will not be visible unless something else is printed in addition.

        [default: hex]
        [possible values: rgb, rgb-float, hex, hsl, hsl-hue, hsl-saturation, hsl-lightness, lch,
        lch-lightness, lch-chroma, lch-hue, lab, lab-a, lab-b, luminance, brightness, ansi-8bit,
        ansi-24bit, ansi-8bit-escapecode, ansi-24bit-escapecode, cmyk, name]"
        AdditionalParameterAttributes   = '[ValidateSet("rgb", "rgb-float", "hex", "hsl", "hsl-hue", "hsl-saturation", "hsl-lightness", "lch", "lch-lightness", "lch-chroma", "lch-hue", "lab", "lab-a", "lab-b", "luminance", "brightness", "ansi-8bit", "ansi-24bit", "ansi-8bit-escapecode", "ansi-24bit-escapecode", "cmyk", "name")]'
        ValueFromPipelineByPropertyName = $false
        Mandatory                       = $false
        DefaultMissingValue             = "hex"
        Position                        = 0
        OriginalPosition                = 0
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
        Position                        = 1
        OriginalPosition                = 1
        Mandatory                       = $true
        ParameterSetName                = "Default"
    }
    Examples                = @{
        Command         = "Format-PastelColor -Order hue -Color white black"
        OriginalCommand = "pastel sort-by hue white black"
        Description     = "Sort colors by hue"
    },
    @{
        Command         = "Format-PastelColor -Order chroma -Color 0000ff 'rgba(119, 136, 153, 0.5)'"
        OriginalCommand = "pastel sort-by chroma 0000ff --unique rgba(119, 136, 153, 0.5)"
        Description     = "Sort 0000ff and rgba(119, 136, 153, 0.5) by chroma"
    },
    @{
        Command         = "Format-PastelColor -Order luminance -Color red, blue, green"
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