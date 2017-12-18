actions
mergePullRequestIntoImage
	(UIManager default confirm: ('I will create a new local branch named {1}. Should I continue?' format: { self pullRequest branchName }))
	ifFalse: [ ^ self ].
	self pullRequest mergeIntoWorkingCopy