tests
testCloneAtAbsoluteLocation
	repository := IceRepository origin: origin location: absoluteLocation.

	self deny: absoluteLocation exists.
	repository createRepository.
	self assert: absoluteLocation exists.
	self assert: (absoluteLocation / '.git') exists.
