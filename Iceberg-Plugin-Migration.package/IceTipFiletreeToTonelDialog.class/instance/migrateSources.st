actions
migrateSources
	|  commit filetreeFiles |
	
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
		properties: { #format -> #tonel } asDictionary; 
		store.
	self repository addFilesToIndex: { (self codeDirectoryWithDelim, '.properties').}.
	"remove .filetree remaining"
	filetreeFiles := self codeDirectory allChildrenMatching: '.filetree'.
	filetreeFiles do: #ensureDelete.
	self repository addFilesToIndex: (filetreeFiles collect: [ :each | 
		((each relativeTo: self codeDirectory) printWithDelimiter: $/) ]).

	"commit"
	self repository 
		commitIndexWithMessage: 'sources migrated' 
		andParents: { commit }.