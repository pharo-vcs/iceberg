tests-tags
testListTagsListsNewTag

	| tags tagName |
	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	tagName := 'new'.
	self repository createTag: tagName.
	tags := self repository tags.
	
	self assert: tags size equals: 1.
	tags
		detect: [ :branch | branch name = tagName ]
		ifNone: [ self fail ]