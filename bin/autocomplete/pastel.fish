complete -c pastel -n "__fish_use_subcommand" -s m -l color-mode -d 'Specify the terminal color mode: 24bit, 8bit, off, *auto*' -r -f -a "{24bit	,8bit	,off	,auto	}"
complete -c pastel -n "__fish_use_subcommand" -l color-picker -d 'Use a specific tool to pick the colors' -r -f -a "{gpick	,xcolor	,wcolor	,grabc	,colorpicker	,chameleon	,kcolorchooser	,zenity	,yad	}"
complete -c pastel -n "__fish_use_subcommand" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_use_subcommand" -s V -l version -d 'Print version information'
complete -c pastel -n "__fish_use_subcommand" -s f -l force-color -d 'Alias for --mode=24bit'
complete -c pastel -n "__fish_use_subcommand" -f -a "color" -d 'Display information about the given color'
complete -c pastel -n "__fish_use_subcommand" -f -a "list" -d 'Show a list of available color names'
complete -c pastel -n "__fish_use_subcommand" -f -a "random" -d 'Generate a list of random colors'
complete -c pastel -n "__fish_use_subcommand" -f -a "distinct" -d 'Generate a set of visually distinct colors'
complete -c pastel -n "__fish_use_subcommand" -f -a "sort-by" -d 'Sort colors by the given property'
complete -c pastel -n "__fish_use_subcommand" -f -a "pick" -d 'Interactively pick a color from the screen (pipette)'
complete -c pastel -n "__fish_use_subcommand" -f -a "format" -d 'Convert a color to the given format'
complete -c pastel -n "__fish_use_subcommand" -f -a "paint" -d 'Print colored text using ANSI escape sequences'
complete -c pastel -n "__fish_use_subcommand" -f -a "gradient" -d 'Generate an interpolating sequence of colors'
complete -c pastel -n "__fish_use_subcommand" -f -a "mix" -d 'Mix two colors in the given colorspace'
complete -c pastel -n "__fish_use_subcommand" -f -a "colorblind" -d 'Simulate a color under a certain colorblindness profile'
complete -c pastel -n "__fish_use_subcommand" -f -a "set" -d 'Set a color property to a specific value'
complete -c pastel -n "__fish_use_subcommand" -f -a "saturate" -d 'Increase color saturation by a specified amount'
complete -c pastel -n "__fish_use_subcommand" -f -a "desaturate" -d 'Decrease color saturation by a specified amount'
complete -c pastel -n "__fish_use_subcommand" -f -a "lighten" -d 'Lighten color by a specified amount'
complete -c pastel -n "__fish_use_subcommand" -f -a "darken" -d 'Darken color by a specified amount'
complete -c pastel -n "__fish_use_subcommand" -f -a "rotate" -d 'Rotate the hue channel by the specified angle'
complete -c pastel -n "__fish_use_subcommand" -f -a "complement" -d 'Get the complementary color (hue rotated by 180°)'
complete -c pastel -n "__fish_use_subcommand" -f -a "gray" -d 'Create a gray tone from a given lightness'
complete -c pastel -n "__fish_use_subcommand" -f -a "to-gray" -d 'Completely desaturate a color (preserving luminance)'
complete -c pastel -n "__fish_use_subcommand" -f -a "textcolor" -d 'Get a readable text color for the given background color'
complete -c pastel -n "__fish_use_subcommand" -f -a "colorcheck" -d 'Check if your terminal emulator supports 24-bit colors.'
complete -c pastel -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pastel -n "__fish_seen_subcommand_from color" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from list" -s s -l sort -d 'Sort order' -r -f -a "{brightness	,luminance	,hue	,chroma	,random	}"
complete -c pastel -n "__fish_seen_subcommand_from list" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from random" -s s -l strategy -d 'Randomization strategy:
   vivid:    random hue, limited saturation and lightness values
   rgb:      samples uniformly in RGB space
   gray:     random gray tone (uniform)
   lch_hue:  random hue, fixed lightness and chroma

Default strategy: \'vivid\'
 ' -r -f -a "{vivid	,rgb	,gray	,lch_hue	}"
complete -c pastel -n "__fish_seen_subcommand_from random" -s n -l number -d 'Number of colors to generate' -r
complete -c pastel -n "__fish_seen_subcommand_from random" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from distinct" -s m -l metric -d 'Distance metric to compute mutual color distances. The CIEDE2000 is more accurate, but also much slower.' -r -f -a "{CIEDE2000	,CIE76	}"
complete -c pastel -n "__fish_seen_subcommand_from distinct" -l print-minimal-distance -d 'Only show the optimized minimal distance'
complete -c pastel -n "__fish_seen_subcommand_from distinct" -s v -l verbose -d 'Print simulation output to STDERR'
complete -c pastel -n "__fish_seen_subcommand_from distinct" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from sort-by" -s r -l reverse -d 'Reverse the sort order'
complete -c pastel -n "__fish_seen_subcommand_from sort-by" -s u -l unique -d 'Remove duplicate colors (equality is determined via RGB values)'
complete -c pastel -n "__fish_seen_subcommand_from sort-by" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from pick" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from format" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from paint" -s o -l on -d 'Use the specified background color' -r
complete -c pastel -n "__fish_seen_subcommand_from paint" -s b -l bold -d 'Print the text in bold face'
complete -c pastel -n "__fish_seen_subcommand_from paint" -s i -l italic -d 'Print the text in italic font'
complete -c pastel -n "__fish_seen_subcommand_from paint" -s u -l underline -d 'Draw a line below the text'
complete -c pastel -n "__fish_seen_subcommand_from paint" -s n -l no-newline -d 'Do not print a trailing newline character'
complete -c pastel -n "__fish_seen_subcommand_from paint" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from gradient" -s n -l number -d 'Number of colors to generate' -r
complete -c pastel -n "__fish_seen_subcommand_from gradient" -s s -l colorspace -d 'The colorspace in which to interpolate' -r -f -a "{Lab	,LCh	,RGB	,HSL	}"
complete -c pastel -n "__fish_seen_subcommand_from gradient" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from mix" -s s -l colorspace -d 'The colorspace in which to interpolate' -r -f -a "{Lab	,LCh	,RGB	,HSL	}"
complete -c pastel -n "__fish_seen_subcommand_from mix" -s f -l fraction -d 'The number between 0.0 and 1.0 determining how much to mix in from the base color.' -r
complete -c pastel -n "__fish_seen_subcommand_from mix" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from colorblind" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from set" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from saturate" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from desaturate" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from lighten" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from darken" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from rotate" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from complement" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from gray" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from to-gray" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from textcolor" -s h -l help -d 'Print help information'
complete -c pastel -n "__fish_seen_subcommand_from colorcheck" -s h -l help -d 'Print help information'
