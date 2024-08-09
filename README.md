# export-AD-security-group-members
Export the member of an Active Directory security group using the [Get-ADGroupMember](https://learn.microsoft.com/en-us/powershell/module/activedirectory/get-adgroupmember?view=windowsserver2022-ps) cmdlet.

## Script Description
The exportADSecGrpMmb.ps1 is a script to export members of a security group.

The script will:
1. Create a function to log all errors, success, and warnings during runtime.
2. Import the [ActiveDirectory module](https://learn.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps). Make sure you have the RSAT services and able to access your DC Active Directory.
3. Set a variable for the logs path, group name, and output path.
> [!IMPORTANT]  
> Make sure you change the variables in the script to match your infomation. This should be the only modification to do. The reset on the script can be run OOB.
4. Export the members from the security group.
5. Append the error or success message to the log file.

