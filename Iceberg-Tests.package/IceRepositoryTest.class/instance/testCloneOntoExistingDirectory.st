tests - create repository
testCloneOntoExistingDirectory
	| location |
	
	location := repository location.
	location ensureCreateDirectory.
	
	repository createRepository: nil.
	self assert: (location / '.git') exists.

