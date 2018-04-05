API-remotes
pullFrom: aRemote
	
	aRemote fetchBranch: self.
	self repository workingCopy mergeCommit: (aRemote remoteBranchNamed: self name) commit.