tests
testCloneAtAbsoluteLocation
	| creator |
	creator := IceRepositoryCreator new 
		url: origin;
		location: self absoluteLocation;
		yourself.

	self absoluteLocation ensureDeleteAll.
	self deny: self absoluteLocation exists.
	repository := creator createRepository.
	self assert: self absoluteLocation exists.
	self assert: (self absoluteLocation / '.git') exists.
