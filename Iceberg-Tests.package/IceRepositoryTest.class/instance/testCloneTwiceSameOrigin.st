tests - create repository
testCloneTwiceSameOrigin
	"You should not be able to create two IceRepositories pointing to the same local repository."
	| secondRepo |
	repository register.
	
	secondRepo := self createTestRepository: origin.
	self should: [ 
			secondRepo register. 
			secondRepo forget. "Clean up in case register does not throw the expected exception."
		]
		raise: IceDuplicatedRepository.
	
	secondRepo location: self absoluteLocation.
	[ secondRepo register ] ensure: [ secondRepo forget ]
