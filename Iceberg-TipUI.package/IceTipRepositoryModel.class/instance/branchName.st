accessing
branchName
	self entity isMissing ifTrue: [ ^ self class unknownBranchLabel ].
	 
	^ [ self entity branch name ]
		on: IceNotInBranch 
		do: [ :e | 'Detached at {1}' format: { self entity headCommit shortId } ]