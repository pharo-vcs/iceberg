tests-branch
testAccessingNonExistingTagRaisesException

	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	self should: [self repository tagNamed: 'nonExisting'] raise: IceTagNotFound