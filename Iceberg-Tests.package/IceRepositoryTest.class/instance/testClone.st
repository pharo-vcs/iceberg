tests
testClone
	self deny: location exists.
	repository createRepository.
	self assert: location exists.
	self assert: (location / '.git') exists.
