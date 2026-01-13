# Plane Project Setup Script for Windows (PowerShell)

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Blue
Write-Host "                   Plane - Project Management Tool                    " -ForegroundColor Blue
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Blue
Write-Host "Setting up your development environment..."

function Copy-EnvFile {
    param (
        [string]$Source,
        [string]$Destination
    )

    if (-not (Test-Path $Source)) {
        Write-Host "Error: Source file $Source does not exist." -ForegroundColor Red
        return $false
    }

    Copy-Item -Path $Source -Destination $Destination -Force
    if ($?) {
        Write-Host "Copied $Destination" -ForegroundColor Green
        return $true
    } else {
        Write-Host "Failed to copy $Destination" -ForegroundColor Red
        return $false
    }
}

$services = @("", "web", "api", "space", "admin", "live")
$success = $true

Write-Host "Setting up environment files..." -ForegroundColor Yellow

foreach ($service in $services) {
    if ($service -eq "") {
        $prefix = ".\"
    } else {
        $prefix = ".\apps\$service\"
    }

    $source = "${prefix}.env.example"
    $dest = "${prefix}.env"
    
    if (-not (Copy-EnvFile -Source $source -Destination $dest)) {
        $success = $false
    }
}

# Generate SECRET_KEY for Django
if (Test-Path ".\apps\api\.env") {
    Write-Host ""
    Write-Host "Generating Django SECRET_KEY..." -ForegroundColor Yellow
    # Generate a random 50-char string
    $chars = 'abcdefghijklmnopqrstuvwxyz0123456789-_=+'
    $rng = New-Object System.Random
    $secretKey = ""
    for ($i = 0; $i -lt 50; $i++) {
        $secretKey += $chars[$rng.Next(0, $chars.Length)]
    }

    Add-Content -Path ".\apps\api\.env" -Value "SECRET_KEY=""$secretKey"""
    Write-Host "Added SECRET_KEY to apps/api/.env" -ForegroundColor Green
} else {
    Write-Host "apps/api/.env not found. SECRET_KEY not added." -ForegroundColor Red
    $success = $false
}

# Install Node dependencies
Write-Host ""
Write-Host "Installing dependencies..." -ForegroundColor Yellow
try {
    # Check if pnpm is installed
    if (Get-Command "pnpm" -ErrorAction SilentlyContinue) {
        # Using cmd /c to ensure pnpm is executed correctly if it's a batch file shim
        cmd /c pnpm install
        if ($LASTEXITCODE -ne 0) { $success = $false }
    } else {
        Write-Host "pnpm not found. Please install pnpm." -ForegroundColor Red
        $success = $false
    }
} catch {
    $success = $false
    Write-Host "Error running pnpm install: $_" -ForegroundColor Red
}

Write-Host ""
Write-Host "Setup status:" -ForegroundColor Yellow
if ($success) {
    Write-Host "Environment setup completed successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Review the .env files in each folder if needed"
    Write-Host "2. Start the services with: docker compose -f docker-compose-local.yml up -d"
    Write-Host ""
    Write-Host "Happy coding!" -ForegroundColor Green
} else {
    Write-Host "Some issues occurred during setup. Please check the errors above." -ForegroundColor Red
    exit 1
}
