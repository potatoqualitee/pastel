$module = "$PSScriptRoot\module"
$json = "$PSScriptRoot\json"
$Version = (Get-Content $PSScriptRoot\version.txt)
Remove-Item $module -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item $json -Recurse -Force -ErrorAction SilentlyContinue

$installed = Import-Module Microsoft.PowerShell.Crescendo -RequiredVersion 1.0.0 -PassThru -ErrorAction SilentlyContinue
if (-not $installed) {
    Install-Module Microsoft.PowerShell.Crescendo -RequiredVersion 1.0.0 -Force -Scope CurrentUser
}

$installed = Import-Module Pester -PassThru -ErrorAction SilentlyContinue
if (-not $installed) {
    Install-Module Pester -Force -Scope CurrentUser
}

New-Item $module -ItemType Directory
New-Item $json -ItemType Directory

Copy-Item -Recurse -Path $PSScriptRoot\bin -Destination $module

$Commands = Get-ChildItem "$PSScriptRoot\src" | ForEach-Object { 
    $Definition = & $_.FullName
    $Command = New-CrescendoCommand -Verb $Definition.Verb -Noun $Definition.Noun -OriginalName $Definition.OriginalName
    $Command.OriginalCommandElements = $Definition.OriginalCommandElements
    $Command.Elevation = $Definition.Elevation
    $Command.Aliases = $Definition.Aliases
    $Command.DefaultParameterSetName = $Definition.DefaultParameterSetName
    $Command.SupportsShouldProcess = $Definition.SupportsShouldProcess
    $Command.ConfirmImpact = $Definition.ConfirmImpact
    $Command.SupportsTransactions = $Definition.SupportsTransactions
    $Command.NoInvocation = $Definition.NoInvocation
    $Command.Description = $Definition.Description
    $Command.OriginalText = $Definition.OriginalText
    $Command.HelpLinks = $Definition.HelpLinks

    if ($Definition.Examples) {
        $Command.Examples = $Definition.Examples | ForEach-Object {
            $Example = New-ExampleInfo -Command $_.Command -OriginalCommand $_.OriginalCommand -Description $_.Description
            $Example
        }
    }

    if ($Definition.Parameters) {
        $Command.Parameters = $Definition.Parameters | ForEach-Object {
            $Parameter = New-ParameterInfo -Name $_.Name -OriginalName $_.OriginalName
            if ($Parameter.OriginalName) {
                $Parameter.OriginalName = $_.OriginalName
            }
            if ($Parameter.OriginalPosition) {
                $Parameter.OriginalPosition = $_.OriginalPosition
            }
            if ($Parameter.Position) {
                $Parameter.Position = $_.Position
            }
            if ($Parameter.OriginalText) {
                $Parameter.OriginalText = $_.OriginalText
            }
            if ($Parameter.Description) {
                $Parameter.Description = $_.Description
            }
            if ($Parameter.DefaultValue) {
                $Parameter.DefaultValue = $_.DefaultValue
            }
            if ($Parameter.DefaultValue) {
                $Parameter.DefaultMissingValue = $_.DefaultMissingValue
            }
            if ($Parameter.ApplyToExecutable) {
                $Parameter.ApplyToExecutable = $_.ApplyToExecutable
            }
            if ($Parameter.AdditionalParameterAttributes) {
                $Parameter.AdditionalParameterAttributes = $_.AdditionalParameterAttributes
            }
            if ($Parameter.Mandatory) {
                $Parameter.Mandatory = $_.Mandatory
            }
            if ($Parameter.Aliases) {
                $Parameter.Aliases = $_.Aliases
            }
            if ($Parameter.ValueFromPipeline) {
                $Parameter.ValueFromPipeline = $_.ValueFromPipeline
            }
            if ($Parameter.ValueFromPipelineByPropertyName) {
                $Parameter.ValueFromPipelineByPropertyName = $_.ValueFromPipelineByPropertyName
            }
            if ($Parameter.ValueFromRemainingArguments) {
                $Parameter.ValueFromRemainingArguments = $_.ValueFromRemainingArguments
            }
            if ($Parameter.NoGap) {
                $Parameter.NoGap = $_.NoGap
            }
            $Parameter
        }
    }

    if ($Definition.OutputHandlers) {
        $Command.OutputHandlers = $Definition.OutputHandlers | ForEach-Object {
            $Handler = New-OutputHandler 
            $Handler.ParameterSetName = $_.ParameterSetName
            $Handler.Handler = $_.Handler
            $Handler.HandlerType = $_.HandlerType
            $Handler.StreamOutput = $_.StreamOutput
            $Handler
        }
    }

    $Command 
}

@{
    '$schema' = 'https://aka.ms/PowerShell/Crescendo/Schemas/2022-06'
    Commands  = $Commands
} | ConvertTo-Json -Depth 5 | Out-File "$json\Commands.json"

Export-CrescendoModule -ConfigurationFile (Get-ChildItem "$json") -ModuleName (Join-Path $module "pastel") -Force 

$code = Get-Content -Path (Join-Path $module "pastel.psm1") -Raw
$oldblock = [regex]::Escape('if ( $__handlerInfo.StreamOutput ) {
            & "pastel" $__commandArgs | & $__handler
        }
        else {
            $result = & "pastel" $__commandArgs
            & $__handler $result
        }')

$code = $code -Replace $oldblock, 'REPLACEHERE'
$code.Replace('REPLACEHERE', 'if ( $__handlerInfo.StreamOutput ) {
            & "pastel" $__commandArgs | & $__handler
        } elseif ($__handlerInfo.Handler) {
            & "pastel" $__commandArgs
        } else {
            $result = & "pastel" $__commandArgs
            & $__handler $result
        }') | Set-Content -Path (Join-Path $module "pastel.psm1")

'if (-not (Get-Command -ErrorAction Ignore "pastel")) {
    if ($isLinux) {
        $Env:PATH += ":$PSScriptRoot/bin/linux"
        chmod +x "$PSScriptRoot/bin/linux/pastel"
    }
    elseif ($isMacOS) {
        $Env:PATH += ":$PSScriptRoot/bin/mac"
        chmod +x "$PSScriptRoot/bin/mac/pastel"
    }
    else {
        $Env:PATH += ";$PSScriptRoot\bin\win"
    }
}' | Add-Content -Path (Join-Path $module "pastel.psm1")

$ManifestInfo = @{
    ModuleVersion = $Version
    Author        = 'Chrissy LeMaire'
    Company       = 'cl'
    Description   = 'PowerShell commands for pastel'
    LicenseUri    = 'https://github.com/potatoqualitee/pastel/blob/main/LICENSE'
    ProjectUri    = 'https://github.com/potatoqualitee/pastel'
}

Update-ModuleManifest -Path (Join-Path $module "pastel.psd1") @ManifestInfo 

Invoke-Pester -Path "$PSScriptRoot\tests"