tests
testClone
	| creator location |
	
	location := self defaultLocationForLocalClonedRepository.
	creator := IceRepositoryCreator new 
		url: origin;
		location: location;
		yourself.
	
	self deny: location exists.
	
	repository := creator createRepository.
	
	self assert: location exists.
	self assert: (location / '.git') exists