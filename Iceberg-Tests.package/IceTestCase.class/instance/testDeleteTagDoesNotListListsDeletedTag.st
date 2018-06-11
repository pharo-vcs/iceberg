tests-tags
testDeleteTagDoesNotListListsDeletedTag

	| tagName |
	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	tagName := 'new'.
	self repository createTag: tagName.
	
	(self repository tagNamed: tagName) delete.
	self assert: self repository tags isEmpty