tests-tags
testCreateExistingTagRaisesError

	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	self repository createTag: 'v1.0'.
	self should: [self repository createTag: 'v1.0'] raise: IceTagAlreadyExists