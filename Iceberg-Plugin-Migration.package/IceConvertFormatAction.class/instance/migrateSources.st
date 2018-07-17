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

	1halt.
	(self repository project propertiesFileIn: repository workingCopy)
		binaryWriteStreamDo: [ :stream |
			stream nextPutAll: (self repository project
				fileFormatId: self format;
				repositoryProperties) contentsString ].
	self repository addFileToIndex: self repository project propertiesFilePath.	
	
	self format = #filetree ifFalse: [ 
		self removeFiletreeRemnants ].
	
	"commit"
	self repository 
		commitIndexWithMessage: 'sources migrated' 
		andParents: { commit }.