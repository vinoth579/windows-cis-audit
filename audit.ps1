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