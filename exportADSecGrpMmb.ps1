<#
Author: John Asare
Date: 08/08/2024

Description: Export security group members. Learn more from https://github.com/asarejohn001/export-AD-security-group-members
#>

# Import the Active Directory module
Import-Module ActiveDirectory

# Fucntion to log output
function Get-Log {
    param (
        [string]$LogFilePath,
        [string]$LogMessage
    )

    # Create the log entry with the current date and time
    $logEntry = "{0} - {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $LogMessage

    # Append the log entry to the log file
    Add-Content -Path $LogFilePath -Value $logEntry
}

# Define the log file path, group name, and output file
$logFilePath = ".\log.txt"
$groupName = "Enter the sec group name"
$outputFile = ".\$groupName.csv"

Try {
    # Signal code begin
    Write-Output "Script execution in-progress..."

    # Attempt to get the group members
    $groupMembers = Get-ADGroupMember -Identity $groupName -ErrorAction Stop

    # Check if any members are returned
    if ($groupMembers) {
        # Export the members to a CSV file
        $groupMembers | Select-Object Name, SamAccountName | Export-Csv -Path $outputFile -NoTypeInformation
        Get-Log -LogFilePath $logFilePath -LogMessage "Successfully exported members of group '$groupName' to '$outputFile'."
    } else {
        Get-Log -LogFilePath $logFilePath -LogMessage "The group '$groupName' has no members."
    }
}
Catch {
    # Handle any errors that occur
    Get-Log -LogFilePath $logFilePath -LogMessage "An error occurred: $_"
}
Finally {
    # Code that runs regardless of success or failure
    Write-Output "Script execution completed."
}