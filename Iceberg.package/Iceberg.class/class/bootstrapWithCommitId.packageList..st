accessing
bootstrapWithCommitId: commitId packageList: packageNameList

	| commit repository |
	repository := IceLibgitRepository new.
	commit := IceUnknownCommit new
		id: commitId;
		repository: repository;
 		yourself.
		
	repository name: 'iceberg'.
	repository workingCopy referenceCommit: commit.
	commit repository: repository.
	
	packageNameList do: [ :each |
		repository workingCopy basicAddPackage: (IcePackage
			named: each
			repository: repository) ].
	
	repository register