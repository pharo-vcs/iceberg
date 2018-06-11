accessing
bootstrapWithCommitId: commitId packageList: packageNameList

	| commit repository |
	commit := (IceUnknownCommit new
			id: commitId;
 			yourself).
	repository := IceLibgitRepository new
		name: 'iceberg';
		workingCopy: (IceWorkingCopy new
		referenceCommit: commit
		yourself).
	commit repository: repository.
	
	packageNameList do: [ :each |
		repository workingCopy basicAddPackage: (IcePackage
			named: each
			repository: repository) ].
	
	repository register