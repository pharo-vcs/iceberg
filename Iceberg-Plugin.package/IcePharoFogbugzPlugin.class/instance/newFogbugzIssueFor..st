actions
newFogbugzIssueFor: aRepository
	IcePharoFogbugzModel new 
		onAccept: [ :branchName | aRepository createBranch: branchName ];
		openWithSpec.