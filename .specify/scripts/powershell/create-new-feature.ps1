#Requires -Version 7.0

<#
.SYNOPSIS
    Creates a new feature specification in the Platform Specification Repository (PSR)

.DESCRIPTION
    This script creates a structured specification directory for a new business capability,
    product area, or feature in the fraud detection platform. It follows versioned
    specification patterns for business contract management.

.PARAMETER Json
    The feature description provided by the user

.PARAMETER Capability
    The business capability or domain area (e.g., "risk-scoring", "transaction-monitoring")

.PARAMETER Version
    The specification version (defaults to "v1.0")

.EXAMPLE
    .\create-new-feature.ps1 -Json "Real-time transaction risk scoring capability"
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$Json,
    
    [Parameter(Mandatory = $false)]
    [string]$Capability,
    
    [Parameter(Mandatory = $false)]
    [string]$Version = "v1.0"
)

# Error handling
$ErrorActionPreference = "Stop"

try {
    # Get repository root
    $repoRoot = git rev-parse --show-toplevel 2>$null
    if ($LASTEXITCODE -ne 0) {
        throw "Not in a git repository"
    }
    
    # Convert to Windows path if necessary
    $repoRoot = $repoRoot -replace '/', '\'
    
    # Derive capability name from user description if not provided
    if (-not $Capability) {
        # Extract key terms and create a capability name
        $words = $Json -split '\s+' | Where-Object { $_.Length -gt 3 -and $_ -notmatch '^(the|and|for|with|from|that|this|will|can|should|must)$' }
        $keyWords = $words | Select-Object -First 3
        $Capability = ($keyWords -join '-').ToLower() -replace '[^a-z0-9\-]', ''
        
        # Fallback if no good words found
        if (-not $Capability) {
            $Capability = "new-capability"
        }
    }
    
    # Create feature branch name
    $timestamp = Get-Date -Format "yyyyMMdd"
    $branchName = "spec/$Capability-$Version-$timestamp"
    
    # Create specifications directory structure
    $specDir = Join-Path $repoRoot "specifications" $Capability $Version
    $specFile = Join-Path $specDir "spec.md"
    $checklistDir = Join-Path $specDir "checklists"
    
    # Ensure we're on main/master branch before creating new branch
    $currentBranch = git rev-parse --abbrev-ref HEAD
    if ($currentBranch -notin @("main", "master")) {
        Write-Warning "Currently on branch '$currentBranch'. Switching to main branch first."
        git checkout main
        if ($LASTEXITCODE -ne 0) {
            git checkout master
            if ($LASTEXITCODE -ne 0) {
                throw "Failed to switch to main/master branch"
            }
        }
    }
    
    # Create and checkout feature branch
    git checkout -b $branchName
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to create feature branch: $branchName"
    }
    
    # Create directory structure
    New-Item -ItemType Directory -Path $specDir -Force | Out-Null
    New-Item -ItemType Directory -Path $checklistDir -Force | Out-Null
    
    # Create initial spec file with basic structure
    $specContent = @"
# Business Capability Specification: $($Capability.Replace('-', ' ').ToTitleCase())

**Specification Branch**: `$branchName`  
**Created**: $(Get-Date -Format "yyyy-MM-dd")  
**Status**: Draft  
**Version**: $Version
**Domain**: Fraud Detection Platform
**Input**: User description: "$Json"

## Specification Metadata

- **Capability Area**: $($Capability.Replace('-', ' ').ToTitleCase())
- **Business Impact**: [To be defined]
- **Regulatory Requirements**: [To be assessed]
- **Integration Points**: [To be identified]
- **Contract Version**: $Version

## Business Context *(mandatory)*

[Describe the business problem this capability solves]

## Stakeholders *(mandatory)*

- **Business Owner**: [To be assigned]
- **Product Owner**: [To be assigned]
- **Compliance Lead**: [To be assigned]
- **Technical Lead**: [To be assigned]

---

*This file will be populated using the specification template during the /speckit.specify process*
"@
    
    # Write initial spec file
    Set-Content -Path $specFile -Value $specContent -Encoding UTF8
    
    # Output JSON for the calling script
    $result = @{
        BRANCH_NAME   = $branchName
        SPEC_FILE     = $specFile
        CAPABILITY    = $Capability
        VERSION       = $Version
        SPEC_DIR      = $specDir
        CHECKLIST_DIR = $checklistDir
    }
    
    # Convert to JSON and output
    $jsonOutput = $result | ConvertTo-Json -Compress
    Write-Output $jsonOutput
    
}
catch {
    Write-Error "Error creating feature specification: $($_.Exception.Message)"
    exit 1
}#!/usr/bin/env pwsh
# Create a new feature
[CmdletBinding()]
param(
    [switch]$Json,
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$FeatureDescription
)
$ErrorActionPreference = 'Stop'

if (-not $FeatureDescription -or $FeatureDescription.Count -eq 0) {
    Write-Error "Usage: ./create-new-feature.ps1 [-Json] <feature description>"
    exit 1
}
$featureDesc = ($FeatureDescription -join ' ').Trim()

# Resolve repository root. Prefer git information when available, but fall back
# to searching for repository markers so the workflow still functions in repositories that
# were initialised with --no-git.
function Find-RepositoryRoot {
    param(
        [string]$StartDir,
        [string[]]$Markers = @('.git', '.specify')
    )
    $current = Resolve-Path $StartDir
    while ($true) {
        foreach ($marker in $Markers) {
            if (Test-Path (Join-Path $current $marker)) {
                return $current
            }
        }
        $parent = Split-Path $current -Parent
        if ($parent -eq $current) {
            # Reached filesystem root without finding markers
            return $null
        }
        $current = $parent
    }
}
$fallbackRoot = (Find-RepositoryRoot -StartDir $PSScriptRoot)
if (-not $fallbackRoot) {
    Write-Error "Error: Could not determine repository root. Please run this script from within the repository."
    exit 1
}

try {
    $repoRoot = git rev-parse --show-toplevel 2>$null
    if ($LASTEXITCODE -eq 0) {
        $hasGit = $true
    }
    else {
        throw "Git not available"
    }
}
catch {
    $repoRoot = $fallbackRoot
    $hasGit = $false
}

Set-Location $repoRoot

$specsDir = Join-Path $repoRoot 'specs'
New-Item -ItemType Directory -Path $specsDir -Force | Out-Null

$highest = 0
if (Test-Path $specsDir) {
    Get-ChildItem -Path $specsDir -Directory | ForEach-Object {
        if ($_.Name -match '^(\d{3})') {
            $num = [int]$matches[1]
            if ($num -gt $highest) { $highest = $num }
        }
    }
}
$next = $highest + 1
$featureNum = ('{0:000}' -f $next)

$branchName = $featureDesc.ToLower() -replace '[^a-z0-9]', '-' -replace '-{2,}', '-' -replace '^-', '' -replace '-$', ''
$words = ($branchName -split '-') | Where-Object { $_ } | Select-Object -First 3
$branchName = "$featureNum-$([string]::Join('-', $words))"

if ($hasGit) {
    try {
        git checkout -b $branchName | Out-Null
    }
    catch {
        Write-Warning "Failed to create git branch: $branchName"
    }
}
else {
    Write-Warning "[specify] Warning: Git repository not detected; skipped branch creation for $branchName"
}

$featureDir = Join-Path $specsDir $branchName
New-Item -ItemType Directory -Path $featureDir -Force | Out-Null

$template = Join-Path $repoRoot '.specify/templates/spec-template.md'
$specFile = Join-Path $featureDir 'spec.md'
if (Test-Path $template) { 
    Copy-Item $template $specFile -Force 
}
else { 
    New-Item -ItemType File -Path $specFile | Out-Null 
}

# Set the SPECIFY_FEATURE environment variable for the current session
$env:SPECIFY_FEATURE = $branchName

if ($Json) {
    $obj = [PSCustomObject]@{ 
        BRANCH_NAME = $branchName
        SPEC_FILE   = $specFile
        FEATURE_NUM = $featureNum
        HAS_GIT     = $hasGit
    }
    $obj | ConvertTo-Json -Compress
}
else {
    Write-Output "BRANCH_NAME: $branchName"
    Write-Output "SPEC_FILE: $specFile"
    Write-Output "FEATURE_NUM: $featureNum"
    Write-Output "HAS_GIT: $hasGit"
    Write-Output "SPECIFY_FEATURE environment variable set to: $branchName"
}
