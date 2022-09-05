
using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'pastel' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'pastel'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'pastel' {
            [CompletionResult]::new('-m', 'm', [CompletionResultType]::ParameterName, 'Specify the terminal color mode: 24bit, 8bit, off, *auto*')
            [CompletionResult]::new('--color-mode', 'color-mode', [CompletionResultType]::ParameterName, 'Specify the terminal color mode: 24bit, 8bit, off, *auto*')
            [CompletionResult]::new('--color-picker', 'color-picker', [CompletionResultType]::ParameterName, 'Use a specific tool to pick the colors')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, 'Print version information')
            [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, 'Print version information')
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'Alias for --mode=24bit')
            [CompletionResult]::new('--force-color', 'force-color', [CompletionResultType]::ParameterName, 'Alias for --mode=24bit')
            [CompletionResult]::new('color', 'color', [CompletionResultType]::ParameterValue, 'Display information about the given color')
            [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterValue, 'Show a list of available color names')
            [CompletionResult]::new('random', 'random', [CompletionResultType]::ParameterValue, 'Generate a list of random colors')
            [CompletionResult]::new('distinct', 'distinct', [CompletionResultType]::ParameterValue, 'Generate a set of visually distinct colors')
            [CompletionResult]::new('sort-by', 'sort-by', [CompletionResultType]::ParameterValue, 'Sort colors by the given property')
            [CompletionResult]::new('pick', 'pick', [CompletionResultType]::ParameterValue, 'Interactively pick a color from the screen (pipette)')
            [CompletionResult]::new('format', 'format', [CompletionResultType]::ParameterValue, 'Convert a color to the given format')
            [CompletionResult]::new('paint', 'paint', [CompletionResultType]::ParameterValue, 'Print colored text using ANSI escape sequences')
            [CompletionResult]::new('gradient', 'gradient', [CompletionResultType]::ParameterValue, 'Generate an interpolating sequence of colors')
            [CompletionResult]::new('mix', 'mix', [CompletionResultType]::ParameterValue, 'Mix two colors in the given colorspace')
            [CompletionResult]::new('colorblind', 'colorblind', [CompletionResultType]::ParameterValue, 'Simulate a color under a certain colorblindness profile')
            [CompletionResult]::new('set', 'set', [CompletionResultType]::ParameterValue, 'Set a color property to a specific value')
            [CompletionResult]::new('saturate', 'saturate', [CompletionResultType]::ParameterValue, 'Increase color saturation by a specified amount')
            [CompletionResult]::new('desaturate', 'desaturate', [CompletionResultType]::ParameterValue, 'Decrease color saturation by a specified amount')
            [CompletionResult]::new('lighten', 'lighten', [CompletionResultType]::ParameterValue, 'Lighten color by a specified amount')
            [CompletionResult]::new('darken', 'darken', [CompletionResultType]::ParameterValue, 'Darken color by a specified amount')
            [CompletionResult]::new('rotate', 'rotate', [CompletionResultType]::ParameterValue, 'Rotate the hue channel by the specified angle')
            [CompletionResult]::new('complement', 'complement', [CompletionResultType]::ParameterValue, 'Get the complementary color (hue rotated by 180°)')
            [CompletionResult]::new('gray', 'gray', [CompletionResultType]::ParameterValue, 'Create a gray tone from a given lightness')
            [CompletionResult]::new('to-gray', 'to-gray', [CompletionResultType]::ParameterValue, 'Completely desaturate a color (preserving luminance)')
            [CompletionResult]::new('textcolor', 'textcolor', [CompletionResultType]::ParameterValue, 'Get a readable text color for the given background color')
            [CompletionResult]::new('colorcheck', 'colorcheck', [CompletionResultType]::ParameterValue, 'Check if your terminal emulator supports 24-bit colors.')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'pastel;color' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;list' {
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'Sort order')
            [CompletionResult]::new('--sort', 'sort', [CompletionResultType]::ParameterName, 'Sort order')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;random' {
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'Randomization strategy:
   vivid:    random hue, limited saturation and lightness values
   rgb:      samples uniformly in RGB space
   gray:     random gray tone (uniform)
   lch_hue:  random hue, fixed lightness and chroma

Default strategy: ''vivid''
 ')
            [CompletionResult]::new('--strategy', 'strategy', [CompletionResultType]::ParameterName, 'Randomization strategy:
   vivid:    random hue, limited saturation and lightness values
   rgb:      samples uniformly in RGB space
   gray:     random gray tone (uniform)
   lch_hue:  random hue, fixed lightness and chroma

Default strategy: ''vivid''
 ')
            [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Number of colors to generate')
            [CompletionResult]::new('--number', 'number', [CompletionResultType]::ParameterName, 'Number of colors to generate')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;distinct' {
            [CompletionResult]::new('-m', 'm', [CompletionResultType]::ParameterName, 'Distance metric to compute mutual color distances. The CIEDE2000 is more accurate, but also much slower.')
            [CompletionResult]::new('--metric', 'metric', [CompletionResultType]::ParameterName, 'Distance metric to compute mutual color distances. The CIEDE2000 is more accurate, but also much slower.')
            [CompletionResult]::new('--print-minimal-distance', 'print-minimal-distance', [CompletionResultType]::ParameterName, 'Only show the optimized minimal distance')
            [CompletionResult]::new('-v', 'v', [CompletionResultType]::ParameterName, 'Print simulation output to STDERR')
            [CompletionResult]::new('--verbose', 'verbose', [CompletionResultType]::ParameterName, 'Print simulation output to STDERR')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;sort-by' {
            [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'Reverse the sort order')
            [CompletionResult]::new('--reverse', 'reverse', [CompletionResultType]::ParameterName, 'Reverse the sort order')
            [CompletionResult]::new('-u', 'u', [CompletionResultType]::ParameterName, 'Remove duplicate colors (equality is determined via RGB values)')
            [CompletionResult]::new('--unique', 'unique', [CompletionResultType]::ParameterName, 'Remove duplicate colors (equality is determined via RGB values)')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;pick' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;format' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;paint' {
            [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Use the specified background color')
            [CompletionResult]::new('--on', 'on', [CompletionResultType]::ParameterName, 'Use the specified background color')
            [CompletionResult]::new('-b', 'b', [CompletionResultType]::ParameterName, 'Print the text in bold face')
            [CompletionResult]::new('--bold', 'bold', [CompletionResultType]::ParameterName, 'Print the text in bold face')
            [CompletionResult]::new('-i', 'i', [CompletionResultType]::ParameterName, 'Print the text in italic font')
            [CompletionResult]::new('--italic', 'italic', [CompletionResultType]::ParameterName, 'Print the text in italic font')
            [CompletionResult]::new('-u', 'u', [CompletionResultType]::ParameterName, 'Draw a line below the text')
            [CompletionResult]::new('--underline', 'underline', [CompletionResultType]::ParameterName, 'Draw a line below the text')
            [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Do not print a trailing newline character')
            [CompletionResult]::new('--no-newline', 'no-newline', [CompletionResultType]::ParameterName, 'Do not print a trailing newline character')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;gradient' {
            [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Number of colors to generate')
            [CompletionResult]::new('--number', 'number', [CompletionResultType]::ParameterName, 'Number of colors to generate')
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'The colorspace in which to interpolate')
            [CompletionResult]::new('--colorspace', 'colorspace', [CompletionResultType]::ParameterName, 'The colorspace in which to interpolate')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;mix' {
            [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'The colorspace in which to interpolate')
            [CompletionResult]::new('--colorspace', 'colorspace', [CompletionResultType]::ParameterName, 'The colorspace in which to interpolate')
            [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'The number between 0.0 and 1.0 determining how much to mix in from the base color.')
            [CompletionResult]::new('--fraction', 'fraction', [CompletionResultType]::ParameterName, 'The number between 0.0 and 1.0 determining how much to mix in from the base color.')
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;colorblind' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;set' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;saturate' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;desaturate' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;lighten' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;darken' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;rotate' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;complement' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;gray' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;to-gray' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;textcolor' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;colorcheck' {
            [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Print help information')
            [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Print help information')
            break
        }
        'pastel;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
