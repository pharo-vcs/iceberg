actions
newFogbugzIssue: aRepository then: aBlock
	(IcePharoCreateBranchFromIssue on: aRepository)
		onAccept: aBlock;
		execute