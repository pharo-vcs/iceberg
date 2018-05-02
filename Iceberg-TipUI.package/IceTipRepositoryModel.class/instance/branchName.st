accessing
branchName
	self entity isMissing ifTrue: [ ^ self class unknownBranchLabel ].
	 
	^ [ self entity branch name ]
		on: IceNotInBranch 
		do: [ :e | 'Detached' ]