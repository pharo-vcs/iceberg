actions
merge: aCommitId into: aBranchName
	| currentBranch |
	currentBranch := self branch.
	[ 
		self checkoutBranch: aBranchName.
		self merge: aCommitId.
	]
	ensure: [ self checkoutBranch: currentBranch ]
