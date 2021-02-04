Extension { #name : #IceTipRepositoriesBrowser }

{ #category : #'*Iceberg-Plugin-Calypso' }
IceTipRepositoriesBrowser class >> calypsoCommandsWith: presenter forRootGroup: aCommandGroup [
	<extensionCommands>

	(ClyBrowseIcebergCommitCommand respondsTo: #forSpec) ifFalse: [
		self flag: #pharoTodo. 
		"
		Temporary workaround due to circular dependency between Calypso and Iceberg.
		Can be removed after merge of https://github.com/pharo-project/pharo/pull/8461 
		"
		^ self ].

	aCommandGroup / self selectionCommandGroupName register:
		ClyBrowseIcebergRepositoryCommand forSpec
]
