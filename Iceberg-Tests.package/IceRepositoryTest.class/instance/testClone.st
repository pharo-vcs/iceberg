tests
testClone
	self deny: self defaultLocation exists.
	repository createRepository.
	self assert: self defaultLocation exists.
	self assert: (self defaultLocation / '.git') exists.
