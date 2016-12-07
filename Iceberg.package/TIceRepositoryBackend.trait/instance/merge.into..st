actions
merge: aCommitId into: aBranchName
	| currentBranch |
	self halt.
	currentBranch := self branch.
	[ 
		self checkoutBranch: aBranchName.
		self merge: aCommitId.
	]
	ensure: [ self checkoutBranch: currentBranch ]
