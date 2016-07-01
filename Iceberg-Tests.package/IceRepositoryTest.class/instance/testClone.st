tests
testClone
	self deny: self defaultLocationForLocalClonedRepository exists.
	repository createRepository.
	self assert: self defaultLocationForLocalClonedRepository exists.
	self assert: (self defaultLocationForLocalClonedRepository / '.git') exists.
