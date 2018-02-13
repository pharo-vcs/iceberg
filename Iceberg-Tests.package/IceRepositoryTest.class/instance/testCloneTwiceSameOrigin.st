tests - create repository
testCloneTwiceSameOrigin
	"You should not be able to create two IceRepositories pointing to the same local repository."
	| secondRepo |
	
	repository register.
	self should: [ 
		secondRepo := self
			createTestRepository: origin
			in: repository location.
			secondRepo register. 
			secondRepo forget. "Clean up in case register does not throw the expected exception."
		]
		raise: IceDuplicatedRepository.

	"Now try at a different location"
	secondRepo := IceRepositoryCreator new 
		url: origin;
		location: self absoluteLocation;
		createRepository.
	
	[ secondRepo register ] ensure: [ secondRepo forget ]
