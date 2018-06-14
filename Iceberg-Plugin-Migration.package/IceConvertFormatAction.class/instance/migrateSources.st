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
	self repository project
		fileFormatId: self format;
		storeIn: repository workingCopy.
	self repository addFileToIndex: self repository project propertiesFilePath.
	
	self format = #filetree ifTrue: [ 
		self removeFiletreeRemnants ].
	
	"commit"
	self repository 
		commitIndexWithMessage: 'sources migrated' 
		andParents: { commit }.