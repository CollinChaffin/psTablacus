#=======================================================================#
#
# Author:				Collin Chaffin
# Last Modified:		09-06-2019 12:00PM
# Filename:				psTablacus.psd1
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

@{
	
	# Script module or binary module file associated with this manifest
	ModuleToProcess		    = 'psTablacus.psm1'
	
	# Version number of this module.
	ModuleVersion		    = '1.0.0.1'
	
	# ID used to uniquely identify this module
	GUID				    = 'dbbda885-9b0a-49c9-af6c-ae62e2cc8d18'
	
	# Author of this module
	Author				    = 'Collin Chaffin'
	
	# Company or vendor of this module
	CompanyName			    = ''
	
	# Copyright statement for this module
	Copyright			    = '(c) 2019. All rights reserved.'
	
	# Description of the functionality provided by this module
	Description			    = 'psTablacus Windows Powershell Module - Installs or updates one or more portable instance(s) of Tablacus'
	
	# Minimum version of the Windows PowerShell engine required by this module
	PowerShellVersion	    = '5.0'
	
	# Processor architecture (None, X86, Amd64, IA64) required by this module
	ProcessorArchitecture   = 'None'
	
	# Modules that must be imported into the global environment prior to importing
	# this module
	RequiredModules		    = @()
	
	# Assemblies that must be loaded prior to importing this module
	RequiredAssemblies	    = @()
	
	# Script files (.ps1) that are run in the caller's environment prior to
	# importing this module
	ScriptsToProcess	    = @()
	
	# Type files (.ps1xml) to be loaded when importing this module
	TypesToProcess		    = @()
	
	# Format files (.ps1xml) to be loaded when importing this module
	FormatsToProcess	    = @()
	
	# Modules to import as nested modules of the module specified in
	# ModuleToProcess
	NestedModules		    = @()
	
	# Functions to export from this module
	FunctionsToExport	    = '*'
	
	# Cmdlets to export from this module
	CmdletsToExport		    = '*'
	
	# Variables to export from this module
	VariablesToExport	    = '*'
	
	# Aliases to export from this module
	AliasesToExport		    = '*'
	
	# List of all modules packaged with this module
	ModuleList			    = @()
	
	# List of all files packaged with this module
	FileList			    = @()
	
	# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
	PrivateData			     = @{
		
		PSData  = @{
			
			# Tags applied to this module. These help with module discovery in online galleries.
			Tags  = 'Tablacus', 'psTablacus', 'Install'
			
			# A URL to the license for this module.
			LicenseUri = 'https://github.com/collinchaffin/psTablacus/blob/master/LICENSE.md'
			
			# A URL to the main website for this project.
			ProjectUri = 'https://github.com/collinchaffin/psTablacus'
			
			# A URL to an icon representing this module.
			# IconUri = ''
			
			# ReleaseNotes of this module
			ReleaseNotes = "v 1.0.0.1	:	09-06-2019	:	Initial release"
		} # End of PSData hashtable
	} # End of PrivateData hashtable
	
}


