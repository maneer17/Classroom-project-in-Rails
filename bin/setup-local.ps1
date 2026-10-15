# Local setup for Windows (Ruby 3.2+, PostgreSQL, Node.js)
$ErrorActionPreference = "Stop"
Set-Location (Split-Path $PSScriptRoot -Parent)

Write-Host "== Checking tools =="
foreach ($cmd in @("ruby", "bundle", "node", "npm", "psql")) {
  if (-not (Get-Command $cmd -ErrorAction SilentlyContinue)) {
    Write-Warning "Missing: $cmd — install Ruby 3.2 (RubyInstaller), PostgreSQL, and Node.js, then re-run."
  }
}

Write-Host "== JavaScript =="
npm install
npm run build:css

Write-Host "== Ruby gems =="
bundle install

Write-Host "== Database =="
$env:PGUSER = if ($env:PGUSER) { $env:PGUSER } else { "postgres" }
$env:PGPASSWORD = if ($env:PGPASSWORD) { $env:PGPASSWORD } else { "postgres" }
bundle exec rails db:prepare
bundle exec rails db:seed

Write-Host ""
Write-Host "Done. Start the app with:"
Write-Host "  bundle exec rails server"
Write-Host ""
Write-Host "Demo accounts:"
Write-Host "  teacher@classroom.local / password123"
Write-Host "  student@classroom.local / password123"
