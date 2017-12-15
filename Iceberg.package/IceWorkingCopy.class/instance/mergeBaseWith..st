merging
mergeBaseWith: aCommit

	self assert: self referenceCommit size = 1.
	^ self referenceCommit first mergeBaseWith: aCommit