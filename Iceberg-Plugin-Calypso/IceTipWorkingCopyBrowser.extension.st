Extension { #name : #IceTipWorkingCopyBrowser }

{ #category : #'*Iceberg-Plugin-Calypso' }
IceTipWorkingCopyBrowser class >> calypsoCommandsWith: presenter forRootGroup: aCommandGroup [
	<extensionCommands>

	aCommandGroup / self selectionCommandGroupName register:
		ClyBrowseIcebergPackageCommand forSpec
]
