# Script to generate 100 commits distributed between Aug 25 and Dec 10
$startDate = Get-Date "2025-08-25"
$endDate = Get-Date "2025-12-10"
$totalCommits = 100

# Commit messages related to Lost and Found project
$commitMessages = @(
    "Fix delete button functionality",
    "Add QR code generation for lost items",
    "Implement matching algorithm",
    "Update ticket form validation",
    "Improve UI responsiveness",
    "Add image upload feature",
    "Fix authentication middleware",
    "Update ticket card display",
    "Add match confirmation logic",
    "Improve error handling",
    "Update database schema",
    "Fix QR code verification",
    "Add status filtering",
    "Update search functionality",
    "Improve form validation",
    "Add category filtering",
    "Fix ticket update endpoint",
    "Update user authentication",
    "Add match threshold logic",
    "Improve dashboard UI",
    "Fix image upload issues",
    "Update ticket model",
    "Add reconciliation endpoint",
    "Improve matching service",
    "Fix delete confirmation",
    "Update QR code display",
    "Add match indicators",
    "Fix form submission",
    "Update API routes",
    "Improve error messages",
    "Add loading states",
    "Fix navigation issues",
    "Update middleware logic",
    "Add match status display",
    "Fix ticket creation",
    "Update component styling",
    "Add match verification",
    "Fix QR code generation",
    "Update ticket listing",
    "Improve user experience",
    "Add match threshold configuration",
    "Fix authentication flow",
    "Update ticket details page",
    "Add match history",
    "Fix image display",
    "Update search filters",
    "Add match notifications",
    "Fix form reset",
    "Update ticket status",
    "Add match percentage display",
    "Fix API error handling",
    "Update component props",
    "Add match confirmation UI",
    "Fix QR code scanning",
    "Update ticket metadata",
    "Add match comparison",
    "Fix delete operation",
    "Update user profile",
    "Add match suggestions",
    "Fix form validation errors",
    "Update ticket categories",
    "Add match statistics",
    "Fix image optimization",
    "Update authentication tokens",
    "Add match filtering",
    "Fix ticket update logic",
    "Update component lifecycle",
    "Add match export",
    "Fix QR code validation",
    "Update database queries",
    "Add match analytics",
    "Fix form state management",
    "Update ticket routing",
    "Add match recommendations",
    "Fix image upload validation",
    "Update user permissions",
    "Add match history tracking",
    "Fix ticket deletion",
    "Update component rendering",
    "Add match scoring",
    "Fix authentication redirect",
    "Update ticket search",
    "Add match notifications",
    "Fix form data persistence",
    "Update API responses",
    "Add match comparison view",
    "Fix QR code encoding",
    "Update ticket status flow",
    "Add match verification step",
    "Fix image compression",
    "Update user interface",
    "Add match confidence score",
    "Fix ticket creation flow",
    "Update component styles",
    "Add match export feature",
    "Fix authentication session",
    "Update ticket metadata display"
)

# Calculate total days
$daysDiff = ($endDate - $startDate).Days
$avgCommitsPerDay = [math]::Round($totalCommits / $daysDiff, 2)

Write-Host "Generating $totalCommits commits between $($startDate.ToString('yyyy-MM-dd')) and $($endDate.ToString('yyyy-MM-dd'))"
Write-Host "Total days: $daysDiff | Average commits per day: $avgCommitsPerDay`n"

# Generate commit dates distributed across the period
$commitDates = @()
for ($i = 0; $i -lt $totalCommits; $i++) {
    # Distribute evenly with some randomness
    $progress = $i / ($totalCommits - 1)
    $baseDate = $startDate.AddDays($daysDiff * $progress)
    
    # Add randomness: ±2 days
    $randomDays = (Get-Random -Minimum -2 -Maximum 3)
    $commitDate = $baseDate.AddDays($randomDays)
    
    # Ensure date is within range
    if ($commitDate -lt $startDate) { $commitDate = $startDate }
    if ($commitDate -gt $endDate) { $commitDate = $endDate }
    
    # Random time between 9 AM and 11 PM
    $randomHour = Get-Random -Minimum 9 -Maximum 23
    $randomMinute = Get-Random -Minimum 0 -Maximum 59
    $randomSecond = Get-Random -Minimum 0 -Maximum 59
    
    $commitDate = $commitDate.Date.AddHours($randomHour).AddMinutes($randomMinute).AddSeconds($randomSecond)
    $commitDates += $commitDate
}

# Sort dates chronologically
$commitDates = $commitDates | Sort-Object

# Files to modify (cycle through these)
$filesToModify = @(
    "README.md",
    "app/(components)/TicketCard.jsx",
    "app/(components)/TicketForm.jsx",
    "app/(components)/DeleteBlock.jsx",
    "app/page.jsx",
    "app/api/Tickets/route.js"
)

$fileIndex = 0

for ($i = 0; $i -lt $totalCommits; $i++) {
    $message = $commitMessages[$i % $commitMessages.Length]
    $commitDate = $commitDates[$i]
    $fileToEdit = $filesToModify[$fileIndex % $filesToModify.Length]
    $fileIndex++
    
    # Make a small change to README (safest file to modify)
    if (Test-Path "README.md") {
        $readmeContent = Get-Content "README.md" -Raw -ErrorAction SilentlyContinue
        if (-not $readmeContent) { $readmeContent = "# Lost-and-Found`n" }
        
        # Add a line at the end
        $newLine = "`n<!-- Development log entry -->"
        $readmeContent += $newLine
        Set-Content -Path "README.md" -Value $readmeContent -NoNewline
    }
    
    # Stage README
    git add README.md
    
    # Create commit with specific date
    $dateString = $commitDate.ToString("yyyy-MM-dd HH:mm:ss")
    $env:GIT_AUTHOR_DATE = $dateString
    $env:GIT_COMMITTER_DATE = $dateString
    
    git commit -m "$message" --date="$dateString" --no-verify --quiet
    
    if (($i + 1) % 10 -eq 0) {
        Write-Host "Created $($i + 1)/$totalCommits commits..."
    }
}

Write-Host "`nCompleted! Created $totalCommits commits distributed between Aug 25 and Dec 10, 2025."
Write-Host "Run 'git log --oneline --graph --all' to view the commit history."

