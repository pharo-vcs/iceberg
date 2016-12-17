tests
testCloneAtAbsoluteLocation
	repository := IceRepositoryCreator new 
		url: origin;
		location: self absoluteLocation;
		yourself.

	self deny: self absoluteLocation exists.
	repository createRepository.
	self assert: self absoluteLocation exists.
	self assert: (self absoluteLocation / '.git') exists.
