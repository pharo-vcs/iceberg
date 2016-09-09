tests - create repository
testClone
	| location headCommitId |
	location := self defaultLocationForLocalClonedRepository.
	
	self deny: location exists.
	
	repository createRepository.
	
	self assert: location exists.
	self assert: (location / '.git') exists.

