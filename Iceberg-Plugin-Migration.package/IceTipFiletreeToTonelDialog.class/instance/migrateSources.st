actions
migrateSources
	| locationDir subDir sourceDir subDirWithDelim commit filetreeFiles |
	
	locationDir := self repository location. 	
	subDir := self repository subdirectory.

	sourceDir := locationDir.
	subDir 
		ifNotNil: [
			subDirWithDelim := subDir, '/'. 
			sourceDir := sourceDir / subDir ]
		ifNil: [
			subDirWithDelim := '' ].

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
	self repository addFilesToIndex: { (subDirWithDelim, '.properties').}.
	"remove .filetree remaining"
	filetreeFiles := sourceDir allChildrenMatching: '.filetree'.
	filetreeFiles do: #ensureDelete.
	self repository addFilesToIndex: (filetreeFiles collect: [ :each | 
		((each relativeTo: locationDir) printWithDelimiter: $/) ]).

	"commit"
	self repository 
		commitIndexWithMessage: 'sources migrated' 
		andParents: { commit }.