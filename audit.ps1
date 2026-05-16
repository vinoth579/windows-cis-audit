Write-Host "=== Windows CIS Audit Tool ==="

# Firewall Check
$firewall = Get-NetFirewallProfile | Select-Object Name, Enabled

foreach ($profile in $firewall) {
    if ($profile.Enabled -eq $true) {
        Write-Host "[PASS] Firewall Enabled for $($profile.Name)"
    }
    else {
        Write-Host "[FAIL] Firewall Disabled for $($profile.Name)"
    }
}

# SMBv1 Check
$smb = Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol

if ($smb.State -eq "Disabled") {
    Write-Host "[PASS] SMBv1 Disabled"
}
else {
    Write-Host "[FAIL] SMBv1 Enabled"
}

# Windows Defender Check
$defender = Get-MpComputerStatus

if ($defender.RealTimeProtectionEnabled -eq $true) {
    Write-Host "[PASS] Windows Defender Real-Time Protection Enabled"
}
else {
    Write-Host "[FAIL] Windows Defender Real-Time Protection Disabled"
}

# Password Policy Check
Write-Host "`n=== Password Policy ==="

$passwordPolicy = net accounts

$passwordPolicy

# Guest Account Check
Write-Host "`n=== Guest Account Check ==="

$guest = Get-LocalUser -Name "Guest"

if ($guest.Enabled -eq $false) {
    Write-Host "[PASS] Guest account is disabled"
}
else {
    Write-Host "[FAIL] Guest account is enabled"
}