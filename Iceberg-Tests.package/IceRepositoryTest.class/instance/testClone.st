tests
testClone
	self deny: defaultLocation exists.
	repository createRepository.
	self assert: defaultLocation exists.
	self assert: (defaultLocation / '.git') exists.
