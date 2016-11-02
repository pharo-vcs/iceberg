tests - create repository
testCloneOntoExistingDirectory
	| location |
	
	location := repository location.
	location ensureCreateDirectory.
	
	repository createRepository.
	self assert: (location / '.git') exists.

