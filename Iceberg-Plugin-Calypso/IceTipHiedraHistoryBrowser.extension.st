Extension { #name : #IceTipHiedraHistoryBrowser }

{ #category : #'*Iceberg-Plugin-Calypso' }
IceTipHiedraHistoryBrowser class >> calypsoCommandsWith: presenter forRootGroup: aCommandGroup [
	<extensionCommands>

	aCommandGroup / self selectionCommandGroupName register:
		ClyBrowseIcebergCommitCommand forSpec
]
