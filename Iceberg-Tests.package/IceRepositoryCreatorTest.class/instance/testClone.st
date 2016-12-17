tests
testClone
	| location |
	location := self defaultLocationForLocalClonedRepository.
	
	self deny: location exists.
	
	repository createRepository: nil.
	
	self assert: location exists.
	self assert: (location / '.git') exists.

