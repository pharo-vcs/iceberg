actions
createRepository	
	| repository |
	self validate.

	"Check if a repository in disk corresponds to the asked repository remote"	
	(self remoteToUse isNotNil and: [ self locationToUse exists and: [ self locationToUse children notEmpty ] ]) ifTrue: [
		repository := IceLibgitRepository new
			location: self locationToUse;
			subdirectory: self subdirectory.
		
		(repository remotes includes: self remoteToUse) ifTrue: [ 
			"If the repository found in disk uses the same remote, we keep it."
			repository workingCopy initializePackagesFromRepository.
			self branchName ifNotNil: [
				repository switchToBranchNamed: self branchName ].
			^ repository
		] ifFalse: [ IceDuplicatedRepository signal: 
					('You already have an Iceberg repository 
at {1}. 

If you really whant create another one, 
please locate it in a different directory.'
					 format: {self locationToUse pathString}) ] ].

	"If no remote was given, just import the repository"	
	self remoteToUse ifNil: [
		repository := IceLibgitRepository new
			location: self locationToUse;
			subdirectory: self subdirectory.
		repository workingCopy initializePackagesFromRepository.
		self branchName ifNotNil: [
			repository switchToBranchNamed: self branchName ].
		^ repository
	].

	"Else, it does not exist in disk and we have to clone it"
	repository := self remoteToUse
		cloneIn: self locationToUse
		subdirectory: self subdirectory.
	self branchName ifNotNil: [
		repository switchToBranchNamed: self branchName ].
	repository workingCopy initializePackagesFromRepository.
	^ repository