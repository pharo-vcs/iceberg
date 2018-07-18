private
migrateSources
	| commit |
	
	"branch if you want to perform the migration on separated place (you 
	can later do a PR)"
	self repository createBranch: self branchName.

	commit := self repository branch commit.
	self repository workingCopy packages do: [ :each | 
		self 
			migratePackage: each 
			commit: commit ].

	(self repository workingCopy fileSystem resolve: self repository properties propertiesFilePath)
		binaryWriteStreamDo: [ :stream |
			stream nextPutAll: (self repository properties
				fileFormatId: self format;
				contentsString)  ].
	self repository addFileToIndex: self repository properties propertiesFilePath.
	
	self format = #filetree ifFalse: [ 
		self removeFiletreeRemnants ].
	
	"commit"
	self repository 
		commitIndexWithMessage: 'sources migrated' 
		andParents: { commit }.