tests-tags
testListTagsOfACommitWithTagsReturnsTagCollection

	self repository head isUnbornBranch ifTrue: [ ^ self skip ].

	self repository headCommit createTag: 'test'.
	self assert: self repository headCommit tags first name equals: 'test'