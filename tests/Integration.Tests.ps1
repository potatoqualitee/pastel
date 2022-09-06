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