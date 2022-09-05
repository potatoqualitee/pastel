# pastel

PowerShell Crescendo module for `pastel`.

# Installation 

This module includes [pastel](https://github.com/sharkdp/pastel) for Linux, macOS and Windows.

To install this module: 

```powershell
Install-Module pastel
```

# Commands

## Get-PastelColorInfo

```powershell
Get-PastelColorInfo [[-Color] <string>]
```

# Contributing

Commands are defined in the [src](./src) directory. Commands are defined by hashtables that match the Crescendo JSON format. 

For example, the `Get-LogonSession` cmdlet is defined using this hashtable. 

```powershell

@{
    Verb                    = "Get"
    Noun                    = "PastelColorInfo"
    OriginalName            = "pastel"
    OriginalCommandElements = "color"
    Synopsis                = "Get information about a color."
    Description             = "Get information about a color."
    Parameters              = @{
        ParameterType                   = "string"
        Name                            = "Color"
        Description                     = "Show and display some information about the given color(s)."
        Mandatory                       = "True"
        ValueFromPipeline               = "True"
        ValueFromPipelineByPropertyName = "True"
        Position                        = 0
        ParameterSetName                = "Default"
    }
    Examples = @{
        Command         = "Get-PastelColorInfo -Color blue"
        OriginalCommand = "patel color blue"
        Description     = "Show and display some information about the given color(s)"
    }
    OutputHandlers          = @{
        ParameterSetName = "Default"
        Handler          = {$true} # My workaround to bypass handlers which can destroy pastel output
        HandlerType      = "Inline"
        StreamOutput     = $false
    }
    HelpLinks               = "https://github.com/sharkdp/pastel"
}
```

To build and test the module, run `build.ps1`. Please note you will need Powershell 7 to run the build.ps1
