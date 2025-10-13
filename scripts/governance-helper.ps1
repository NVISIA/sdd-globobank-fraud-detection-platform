# GloboBank Governance Helper Script for Testing Copilot Instructions
param(
    [Parameter(Mandatory = $true)]
    [string]$Query,
    
    [Parameter(Mandatory = $false)]
    [string]$Context = "",
    
    [Parameter(Mandatory = $false)]
    [ValidateSet("organization", "coe", "domain", "auto")]
    [string]$TierPreference = "auto",
    
    [Parameter(Mandatory = $false)]
    [int]$MaxResults = 5
)

Write-Host "🏛️ Querying GloboBank Governance (Testing Copilot Instructions)..." -ForegroundColor Cyan
Write-Host "Query: $Query" -ForegroundColor Yellow

# Check if RAG server is running
try {
    $healthCheck = Invoke-RestMethod -Uri "http://localhost:8000/health" -Method Get -TimeoutSec 5
    Write-Host "✅ Governance server is running (Status: $($healthCheck.status))" -ForegroundColor Green
}
catch {
    Write-Host "❌ Governance server not running. Please start it first:" -ForegroundColor Red
    Write-Host "   cd ../sdd-globobank-rag-governance-solution" -ForegroundColor Gray
    Write-Host "   .\scripts\start.bat" -ForegroundColor Gray
    exit 1
}

# Prepare the request body
$body = @{
    name      = "rag_query"
    arguments = @{
        query           = $Query
        context         = if ($Context) { @{ description = $Context } } else { @{} }
        tier_preference = $TierPreference
        max_results     = $MaxResults
    }
} | ConvertTo-Json -Depth 3

try {
    $response = Invoke-RestMethod -Uri "http://localhost:8000/mcp/call_tool" -Method Post -Body $body -ContentType "application/json"
    
    Write-Host "`n📋 Governance Guidance:" -ForegroundColor Green
    Write-Host "=" * 60
    Write-Host $response.content[0].text -ForegroundColor White
    
    if ($response.metadata -and $response.metadata.sources) {
        Write-Host "`n📚 Sources:" -ForegroundColor Blue
        foreach ($source in $response.metadata.sources) {
            $tier = if ($source.tier) { $source.tier } else { "unknown" }
            $score = if ($source.relevance_score) { [math]::Round($source.relevance_score, 2) } else { "N/A" }
            Write-Host "  • $($source.document) (Tier: $tier, Relevance: $score)" -ForegroundColor Gray
        }
    }
    
    Write-Host "`n✅ Governance query completed successfully!" -ForegroundColor Green
    
}
catch {
    Write-Host "`n❌ Error querying governance:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host "`nTroubleshooting:" -ForegroundColor Yellow
    Write-Host "1. Check if RAG server is running: http://localhost:8000/health" -ForegroundColor Gray
    Write-Host "2. Verify MCP configuration in .vscode/settings.json" -ForegroundColor Gray
    Write-Host "3. Check network connectivity to localhost:8000" -ForegroundColor Gray
}