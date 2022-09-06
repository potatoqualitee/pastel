Import-Module "$PSScriptRoot\..\module\pastel.psd1" -Force

Describe "Module functionality" {
    It "should have added pastel to the path" {
        pastel color white | Should -Match hsl
    }
}

Describe "Get-PastelColor" {
    It "should have command" {
        Get-Command Get-PastelColor | Should -not -BeNullOrEmpty
    }
}

Describe "Get-PastelColorList" {
    It "should have command" {
        Get-Command Get-PastelColorList | Should -not -BeNullOrEmpty
    }
}

Describe "New-PastelRandomColor" {
    It "should have command" {
        Get-Command New-PastelRandomColor | Should -not -BeNullOrEmpty
    }
    It "should work" {
        (New-PastelRandomColor -Strategy vivid -Number 5 | Measure-Object).Count | Should -Be 5
    }
}

Describe "Get-PastelDistinctColor" {
    It "should work without throwing" {
        Get-PastelDistinctColor -Count 2 -Metric CIEDE2000 white | Should -not -BeNullOrEmpty
    }
    It "should work" {
        (Get-PastelDistinctColor black -Count 5 -Metric CIE76 | Measure-Object).Count | Should -Be 5
    }
}

Describe "Invoke-PastelColorSort" {
    It "should work" {
        (Invoke-PastelColorSort -Order luminance -Color red, blue, green | Measure-Object).Count | Should -Be 3
    }
}

Describe "Format-PastelColor" {
    It "output hex by default" {
        Format-PastelColor -Color white | Should -Match "ffffff"
    }
    It "should work" {
        Format-PastelColor -Color white -Type luminance | Should -Be "1.000"
    }
}

Describe "Write-PastelColoredText" {
    It "should work" {
        Write-PastelColoredText -Color blue -Text sup -BackgroundColor white | Should -Match "sup"
    }
}

Describe "Show-PastelGradient" {
    It "should work" {
        (Show-PastelGradient -ColorSpace RGB -Color1 ffffcc -Color2 fd8d3c -Number 3 | Measure-Object).Count | Should -Be 3
    }
}

Describe "Invoke-PastelColorMix" {
    It "should work" {
        (Invoke-PastelColorMix -ColorSpace RGB -Color1 red -Color2 blue).Trim() |  Should -Be 'hsl(300,100.0%,25.1%)'
    }
}

Describe "Invoke-PastelColorMix" {
    It "should work" {
        ConvertTo-PastelColorBlind -Type prot -Color '#FF0000', '#00FF00', '#0000FF' | Should -Not -BeNullOrEmpty
    }
}

Describe "Edit-PastelColorProperty" {
    It "should work" {
        Edit-PastelColorProperty -Property hue -Value 10 -Color f5ee92 | Should -Not -BeNullOrEmpty
    }
}

Describe "Add-PastelSaturation" {
    It "should work" {
        Add-PastelSaturation -Amount 0.1 -Color red | Should -Not -BeNullOrEmpty
    }
}

Describe "Remove-PastelSaturation" {
    It "should work" {
        (Remove-PastelSaturation -Amount 0.1 -Color red).Trim() | Should -Be 'hsl(0,100.0%,50.0%)'
    }
}
Describe "Add-PastelLightness" {
    It "should work" {
        Add-PastelLightness -Amount 0.1 -Color red | Should -Not -BeNullOrEmpty
    }
}

Describe "Remove-PastelLightness" {
    It "should work" {
        Remove-PastelLightness -Amount 0.1 -Color red | Should -Not -BeNullOrEmpty
    }
}

Describe "Invoke-PastelRotateColor" {
    It "should work" {
        (Invoke-PastelRotateColor -Degree 180 -Color red).Trim() | Should -Be 'hsl(180,100.0%,50.0%)'
    }
}

Describe "ConvertTo-PastelGrayTone" {
    It "should work" {
        (ConvertTo-PastelGrayTone -Color blue).Trim() | Should -Be 'hsl(240,0.0%,29.8%)'
    }
}

Describe "Get-PastelTextColor" {
    It "should work" {
        (Get-PastelTextColor -Color blue).Trim() | Should -Be 'hsl(0,0.0%,100.0%)'
    }
}