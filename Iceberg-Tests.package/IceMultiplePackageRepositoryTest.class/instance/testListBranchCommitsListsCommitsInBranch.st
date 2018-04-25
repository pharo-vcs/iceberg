tests-queries
testListBranchCommitsListsCommitsInBranch

	| branches commits |
	branches := self repository allBranches.
	commits := branches first commits.
	
	self assert: commits size equals: self expectedCommitsInNewBranch.
	self assert: commits first comment equals: 'Initial commit'.