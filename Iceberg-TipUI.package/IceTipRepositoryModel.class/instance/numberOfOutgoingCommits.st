accessing
numberOfOutgoingCommits
	^ [ self outgoingCommits size ]
		on: IceNotInBranch do: [ :e | 0 ]