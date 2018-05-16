API-remotes
pullFrom: aRemote
	
	| remoteBranch |
	aRemote fetchBranch: self.
	remoteBranch := aRemote
		remoteBranchNamed: self name
		ifAbsent: [ ^ self ].
	self repository workingCopy mergeCommit: remoteBranch commit.