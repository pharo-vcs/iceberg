instance-creation
name: aString remoteRepository: aRepository branchRepository: aMCBranchRepository

	^ self new
		name: aString;
		remoteRepository: aRepository;
		branchRepository: aMCBranchRepository;
		yourself