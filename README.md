# Windows CIS Audit Tool

Simple PowerShell-based CIS benchmark scanner for Windows systems.

## Overview

This project is a lightweight Windows security auditing tool written in PowerShell.  
It performs basic CIS-style security checks on a Windows machine and reports PASS/FAIL results.

---

## Current Features

The tool currently checks:

- Windows Firewall status
- SMBv1 status
- Windows Defender Real-Time Protection
- Password policy settings
- Guest account status
- UAC (User Account Control)
- Remote Desktop configuration
- Windows Update service status

---

## Example Output

```powershell
=== Windows CIS Audit Tool ===

[PASS] Firewall Enabled for Domain
[PASS] Firewall Enabled for Private
[PASS] Firewall Enabled for Public

[PASS] SMBv1 Disabled

[PASS] Windows Defender Real-Time Protection Enabled

=== Password Policy ===
[FAIL] Minimum password length is 0

=== Guest Account Check ===
[PASS] Guest account is disabled

=== UAC Check ===
[PASS] UAC is enabled

=== Remote Desktop Check ===
[FAIL] Remote Desktop is enabled

=== Windows Update Check ===
[FAIL] Windows Update service is not running
