tests-tags
testListTagsOfACommitWithNoTagsReturnsEmptyCollection

	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	self assert: self repository headCommit tags isEmpty