# Set path - can be changed
$sourcePath = ""

# Get all files in the directory
Get-ChildItem $sourcePath | ForEach-Object {
    $file = $_.FullName
    $date = Get-Date ($_.LastWriteTime)
    $year = $date.Year
    $month = $date.Month
    $day = $date.Day
    $MonthPath = "$sourcePath\$year.$month.$day"

    # Create the folder if it doesn't exist
    if (!(Test-Path -Path $MonthPath)) {
        New-Item -ItemType directory -Path $MonthPath | Out-Null
    }

    # Move the file to the appropriate folder
    Move-Item $file $MonthPath | Out-Null
}

Write-Host "Files have been sorted into folders."
