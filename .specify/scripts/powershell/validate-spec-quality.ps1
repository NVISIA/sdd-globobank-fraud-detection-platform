#Requires -Version 7.0

<#
.SYNOPSIS
    Validates specification quality against PSR standards

.DESCRIPTION
    Performs comprehensive validation of business capability specifications
    against the Platform Specification Repository quality standards including
    constitutional compliance, consistency checks, and completeness validation.

.PARAMETER SpecFile
    Path to the specification file to validate

.PARAMETER ConstitutionFile
    Path to the platform constitution file (optional)

.EXAMPLE
    .\validate-spec-quality.ps1 -SpecFile "specifications\risk-scoring\v1.0\spec.md"
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$SpecFile,
    
    [Parameter(Mandatory = $false)]
    [string]$ConstitutionFile
)

$ErrorActionPreference = "Stop"

function Test-ConstitutionalCompliance {
    param($Content, $Constitution)
    
    $violations = @()
    
    # Check for security-first principle compliance
    if ($Content -notmatch "security|authentication|authorization|encryption") {
        $violations += "Missing security considerations (Constitutional Principle I: Security-First Development)"
    }
    
    # Check for real-time processing requirements
    if ($Content -match "fraud|transaction" -and $Content -notmatch "real-time|latency|response time") {
        $violations += "Missing real-time processing requirements (Constitutional Principle II)"
    }
    
    # Check for AI/ML governance if applicable
    if ($Content -match "machine learning|ML|model|algorithm|AI" -and $Content -notmatch "validation|bias|governance") {
        $violations += "Missing AI/ML governance requirements (Constitutional Principle III)"
    }
    
    # Check for regulatory compliance
    if ($Content -notmatch "compliance|regulatory|BSA|AML|FFIEC") {
        $violations += "Missing regulatory compliance considerations (Constitutional Principle VII)"
    }
    
    return $violations
}

function Test-SpecificationCompleteness {
    param($Content)
    
    $requiredSections = @(
        "Business Context",
        "Stakeholders", 
        "User Scenarios & Testing",
        "Requirements",
        "Success Criteria"
    )
    
    $missingSections = @()
    foreach ($section in $requiredSections) {
        if ($Content -notmatch "## $section") {
            $missingSections += $section
        }
    }
    
    return $missingSections
}

function Test-RequirementQuality {
    param($Content)
    
    $issues = @()
    
    # Check for implementation details in requirements
    $implPatterns = @(
        "Java|Python|JavaScript|React|Angular|Vue",
        "MySQL|PostgreSQL|MongoDB|Redis",
        "AWS|Azure|GCP|Kubernetes|Docker",
        "REST|GraphQL|gRPC|HTTP"
    )
    
    foreach ($pattern in $implPatterns) {
        if ($Content -match $pattern) {
            $issues += "Contains implementation details: $pattern (should be technology-agnostic)"
        }
    }
    
    # Check for measurable success criteria
    if ($Content -match "Success Criteria" -and $Content -notmatch "\d+%|\d+ms|\d+ seconds|\d+ minutes") {
        $issues += "Success criteria may not be measurable (missing specific metrics)"
    }
    
    return $issues
}

function Test-DataConsistency {
    param($SpecFile)
    
    $issues = @()
    $repoRoot = git rev-parse --show-toplevel
    $specificationsDir = Join-Path $repoRoot "specifications"
    
    if (Test-Path $specificationsDir) {
        $allSpecs = Get-ChildItem -Path $specificationsDir -Recurse -Name "spec.md"
        
        # Extract entities and terms from current spec
        $currentContent = Get-Content $SpecFile -Raw
        $currentEntities = [regex]::Matches($currentContent, '\*\*([A-Z][a-zA-Z\s]+)\*\*') | 
        ForEach-Object { $_.Groups[1].Value }
        
        # Check consistency across other specs (basic implementation)
        foreach ($otherSpec in $allSpecs) {
            $otherSpecPath = Join-Path $specificationsDir $otherSpec
            if ($otherSpecPath -ne $SpecFile) {
                $otherContent = Get-Content $otherSpecPath -Raw -ErrorAction SilentlyContinue
                if ($otherContent) {
                    # Check for conflicting entity definitions (simplified)
                    foreach ($entity in $currentEntities) {
                        if ($otherContent -match $entity -and 
                            $otherContent -match "Entity.*$entity" -and
                            $currentContent -match "Entity.*$entity") {
                            # This is a simplified check - in practice, you'd want more sophisticated parsing
                            $issues += "Potential entity definition conflict for '$entity' with $otherSpec"
                        }
                    }
                }
            }
        }
    }
    
    return $issues
}

try {
    # Validate input file exists
    if (-not (Test-Path $SpecFile)) {
        throw "Specification file not found: $SpecFile"
    }
    
    # Load specification content
    $specContent = Get-Content $SpecFile -Raw
    
    # Load constitution if provided
    $constitution = ""
    if ($ConstitutionFile -and (Test-Path $ConstitutionFile)) {
        $constitution = Get-Content $ConstitutionFile -Raw
    }
    elseif (-not $ConstitutionFile) {
        $repoRoot = git rev-parse --show-toplevel
        $defaultConstitution = Join-Path $repoRoot ".specify" "memory" "constitution.md"
        if (Test-Path $defaultConstitution) {
            $constitution = Get-Content $defaultConstitution -Raw
        }
    }
    
    # Perform validation checks
    $results = @{
        File          = $SpecFile
        Timestamp     = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Checks        = @{
            ConstitutionalCompliance = @{
                Status = "Unknown"
                Issues = @()
            }
            Completeness             = @{
                Status          = "Unknown" 
                MissingSections = @()
            }
            RequirementQuality       = @{
                Status = "Unknown"
                Issues = @()
            }
            DataConsistency          = @{
                Status = "Unknown"
                Issues = @()
            }
        }
        OverallStatus = "Unknown"
    }
    
    # Constitutional compliance check
    if ($constitution) {
        $constitutionalIssues = Test-ConstitutionalCompliance -Content $specContent -Constitution $constitution
        $results.Checks.ConstitutionalCompliance.Issues = $constitutionalIssues
        $results.Checks.ConstitutionalCompliance.Status = if ($constitutionalIssues.Count -eq 0) { "PASS" } else { "FAIL" }
    }
    
    # Completeness check
    $missingSections = Test-SpecificationCompleteness -Content $specContent
    $results.Checks.Completeness.MissingSections = $missingSections
    $results.Checks.Completeness.Status = if ($missingSections.Count -eq 0) { "PASS" } else { "FAIL" }
    
    # Requirement quality check
    $qualityIssues = Test-RequirementQuality -Content $specContent
    $results.Checks.RequirementQuality.Issues = $qualityIssues
    $results.Checks.RequirementQuality.Status = if ($qualityIssues.Count -eq 0) { "PASS" } else { "WARN" }
    
    # Data consistency check
    $consistencyIssues = Test-DataConsistency -SpecFile $SpecFile
    $results.Checks.DataConsistency.Issues = $consistencyIssues
    $results.Checks.DataConsistency.Status = if ($consistencyIssues.Count -eq 0) { "PASS" } else { "WARN" }
    
    # Determine overall status
    $failCount = ($results.Checks.Values | Where-Object { $_.Status -eq "FAIL" }).Count
    $warnCount = ($results.Checks.Values | Where-Object { $_.Status -eq "WARN" }).Count
    
    if ($failCount -gt 0) {
        $results.OverallStatus = "FAIL"
    }
    elseif ($warnCount -gt 0) {
        $results.OverallStatus = "WARN"  
    }
    else {
        $results.OverallStatus = "PASS"
    }
    
    # Output results as JSON
    $jsonOutput = $results | ConvertTo-Json -Depth 10
    Write-Output $jsonOutput
    
}
catch {
    $errorResult = @{
        File          = $SpecFile
        Timestamp     = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Error         = $_.Exception.Message
        OverallStatus = "ERROR"
    }
    
    $jsonOutput = $errorResult | ConvertTo-Json
    Write-Output $jsonOutput
    exit 1
}