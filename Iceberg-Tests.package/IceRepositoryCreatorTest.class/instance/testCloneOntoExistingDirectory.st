tests
testCloneOntoExistingDirectory
	| location creator |
	
	creator := IceRepositoryCreator new 
		url: origin;
		yourself.
	location := creator defaultLocation.
	location ensureCreateDirectory.
	
	repository := creator createRepository.
	self assert: (location / '.git') exists.