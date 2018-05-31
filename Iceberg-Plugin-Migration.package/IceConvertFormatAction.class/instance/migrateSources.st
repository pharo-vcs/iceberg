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

	"add .properties"
	IceRepositoryProperties new 
		repository: self repository;
		properties: { #format -> self format } asDictionary; 
		store.
	self repository addFilesToIndex: { (self codeDirectoryWithDelim, '.properties').}.
	self format = #filetree ifTrue: [ 
		self removeFiletreeRemnants ].
	"commit"
	self repository 
		commitIndexWithMessage: 'sources migrated' 
		andParents: { commit }.