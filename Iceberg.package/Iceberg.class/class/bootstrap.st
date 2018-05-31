accessing
bootstrap

	| metacelloRegistrationEntry commit repository |
	metacelloRegistrationEntry := MetacelloProjectRegistration registry baselineRegistry at: 'BaselineOfIceberg'.
	commit := (IceUnknownCommit new
			id: metacelloRegistrationEntry currentVersionString;
 			yourself).
	repository := IceLibgitRepository new
		name: 'iceberg';
		workingCopy: (IceWorkingCopy new
		referenceCommit: commit
		yourself).
	commit repository: repository.
	
	metacelloRegistrationEntry baselineProjectSpec version packages do: [ :each |
		repository workingCopy basicAddPackage: (IcePackage
			named: each name
			repository: repository) ].
	
	repository register