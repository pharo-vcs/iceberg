tests - create repository
testCloneAtAbsoluteLocation
	repository := IceRepository origin: origin location: self absoluteLocation.

	self deny: self absoluteLocation exists.
	repository createRepository.
	self assert: self absoluteLocation exists.
	self assert: (self absoluteLocation / '.git') exists.
