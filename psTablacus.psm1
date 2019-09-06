#=======================================================================#
#
# Author:				Collin Chaffin
# Last Modified:		09-06-2019 12:00PM
# Filename:				psTablacus.psm1
#
#
# Changelog:
#
#	v 1.0.0.1	:	09-06-2019	:	Initial release
#
# Notes:
#
#   **************************************************************************************************************
#	** I am not the author of Tablacus just a contributor. Please contact Gaku for anything related to Tablacus **
#   ** Github:   https://github.com/tablacus/TablacusExplorer                                                   **
#   ** Website:  https://tablacus.github.io/explorer_en.html                                                    **
#   **************************************************************************************************************
#
#   Tablacus, in my opinion, is by far, hands-down, the BEST Windows Explorer replacement.
#
#   This Powershell module installs or updates one or more instance(s) of Tablacus.
#
#   Since it is fully portable and uses config files in it's local instance, there are no 
#   easy methods via registry or appdata to locate existing instance(s).
#		
#   Also, since I myself routinely have multiple instances of TE (either for running, 
#   other systems via shared storage, or backup) I have allowed multiple instances paths to process.
#	
#
# Installation Instructions:
#
#	Install via the PSGallery via:
#	
#	    Install-Module psTablacus -AllowPrerelease -Scope AllUsers
#
#	Once installed, open Windows Powershell and execute:
#
#	    Import-Module psTablacus
#
#	To install or update a single instance of TE:
#
#       PS C:\> Install-Tablacus -Instance 'C:\Portable\Tablacus'
#
#	To install or update a multiple instances of TE (where Tablacus02 in this example is a fresh install):
#
#       PS C:\> Install-Tablacus -Instance 'C:\Portable\Tablacus01','C:\Portable\Tablacus02'
#
#
#=======================================================================#
#Requires -Version 5.0
using namespace System.Management.Automation

#region Globals

#########################################################################
# 							Global Variables							#
#########################################################################

# General Variables




#########################################################################

#endregion



#region Functions

#########################################################################
# 								Functions								#
#########################################################################

# HELPER
function Write-InfoInColor
{
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[String]$Message,
		[Parameter(Mandatory = $false)]
		[ValidateNotNullOrEmpty()]
		[System.ConsoleColor[]]$Background = $Host.UI.RawUI.BackgroundColor,
		[Parameter(Mandatory = $false)]
		[ValidateNotNullOrEmpty()]
		[System.ConsoleColor[]]$Foreground = $Host.UI.RawUI.ForegroundColor,
		[Switch]$NoNewline
	)
	
	[HostInformationMessage]$outMessage = @{
		Message			    = $Message
		ForegroundColor	    = $Foreground
		BackgroundColor	    = $Background
		NoNewline		    = $NoNewline
	}
	Write-Information $outMessage -InformationAction Continue
}


function Test-RunningTEinstance
{
<#
	.SYNOPSIS
		Helper function to verify TE is not running
	
	.DESCRIPTION
		Helper function to verify TE is not running
	
	.PARAMETER Instance
		Full path to TE instance.
	
	.EXAMPLE
		PS C:\> Test-RunningTEinstance -Instance 'C:\Portable\Tablacus'
	
	.NOTES
		Additional information about the function.
#>
	
	[OutputType([System.Boolean])]
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[Alias('Path')]
		[System.String]$Instance
	)
	
	# HELPER FUNCTION
	# Verify TE instance is not running but do it right and limit that test to THIS instance of TE (we don't care if other instance keep running)
	$runningTE32 = Get-Process -Name "TE32" -ErrorAction SilentlyContinue
	$runningTE64 = Get-Process -Name "TE64" -ErrorAction SilentlyContinue
	
	# Since multiples can run, must remember to loop through ALL to test
	if ($runningTE32 -or $runningTE64)
	{
		foreach ($teProc in $runningTE32)
		{
			if ((Split-Path $teProc.Path) -eq $Instance)
			{				
				return $true
			}
			
		}
		foreach ($teProc in $runningTE64)
		{
			if ((Split-Path $teProc.Path) -eq $Instance)
			{				
				return $true
			}
			
		}
	}
	return $false
}

function Install-Tablacus
{
<#
	.SYNOPSIS
		Installs or updates instances of Tablacus
	
	.DESCRIPTION
		This function will either install new or update instances of Tablacus.
		
		Since it is fully portable and uses config files in it's local instance, there are no easy methods via registry or appdata to locate existing instance(s).
		
		Also, since I myself routinely have multiple instances of TE (either for running, other systems via shared storage, or backup) I have allowed multiple instances paths to process.
	
	.PARAMETER Instance
		Full path to TE instance.  Comma separate to pass multiple.
	
	.EXAMPLE
		#SINGLE INSTANCE
		PS C:\> Install-Tablacus -Instance 'C:\Portable\Tablacus'
	
	.EXAMPLE
		#MULTIPLE INSTANCES
		PS C:\> Install-Tablacus -Instance 'C:\Portable\Tablacus01','C:\Portable\Tablacus02'
	
	.NOTES
		
#>	
	param
	(
		[Parameter(Mandatory = $true)]
		[ValidateNotNullOrEmpty()]
		[Alias('Path')]
		[System.String[]]$Instances
	)
	
	$tmpFile = "$env:TEMP\te.zip"
	
	foreach ($teInstance in $Instances)
	{				
		try
		{
			Write-InfoInColor "`n=====================================================================================================" -Foreground 'DarkCyan'
			Write-InfoInColor "Attempting to install/update instance: $($teInstance)" -Foreground 'Cyan'
			Write-InfoInColor "=====================================================================================================`n" -Foreground 'DarkCyan'
			
			
			# Verify TE instance is not running but get fancy and limit that test to THIS instance of TE (others can continue to run) :)
			if (!(Test-RunningTEinstance -Instance $teInstance))
			{
				
				# Verify if new install or updating existing
				if (!(Test-Path -Path $teInstance)) # New Install
				{
					Write-InfoInColor "Installing new instance: $($teInstance)" -Foreground 'Cyan'
					New-Item $teInstance -ItemType Directory -Force | Out-Null
				}
				else # Updating existing
				{
					Write-InfoInColor "Updating instance: $($teInstance)" -Foreground 'Cyan'
				}
				
				# Download the latest release via Github to a temp file in user's TEMP folder
				Invoke-WebRequest -Uri (($(iwr "https://api.github.com/repos/tablacus/tablacusexplorer/releases/latest").Content | ConvertFrom-Json).assets.browser_download_url) -OutFile $tmpFile -ErrorAction Stop
				
				# Expand it to the target instance - overwriting since the distribution is only binaries and no config data
				Expand-Archive $tmpFile $teInstance -Force -ShowProgress -ErrorAction Stop
				
				Write-InfoInColor "Successfully completed instance: $($teInstance)`n" -Foreground 'Cyan'
				Write-InfoInColor "=====================================================================================================`n" -Foreground 'DarkCyan'
				
			}
			else
			{
				Write-InfoInColor "`nYou have a running instance at: $($teInstance).  Please close it before attemping to update!  Skipping." -Foreground 'Yellow'
			}
		}
		catch
		{
			Throw $("ERROR OCCURRED WHILE EXECUTING: " + $_.Exception.Message)
		}
		
	}
}

#########################################################################

#endregion


### Export all functions
Export-ModuleMember -Function Install-Tablacus,Test-RunningTEinstance

