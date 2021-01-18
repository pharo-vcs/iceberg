Extension { #name : #IceTipRepositoriesBrowser }

{ #category : #'*Iceberg-Plugin-Calypso' }
IceTipRepositoriesBrowser class >> calypsoCommandsWith: presenter forRootGroup: aCommandGroup [
	<extensionCommands>

	aCommandGroup / self selectionCommandGroupName register:
		ClyBrowseIcebergRepositoryCommand forSpec
]
