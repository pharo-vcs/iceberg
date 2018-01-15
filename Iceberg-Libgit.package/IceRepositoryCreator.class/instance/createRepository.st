actions
createRepository	
	| repository |
	self validate.

	self remoteToUse ifNil: [
		repository := IceLibgitRepository new
			location: self locationToUse;
			subdirectory: self subdirectory.
		repository workingCopy initializePackagesFromRepository.
		^ repository
	].

	repository := self remoteToUse
		cloneIn: self locationToUse
		subdirectory: self subdirectory.
		
	self branchName ifNotNil: [
		repository switchToBranchNamed: self branchName ].
	
	repository workingCopy initializePackagesFromRepository.
	
	^ repository