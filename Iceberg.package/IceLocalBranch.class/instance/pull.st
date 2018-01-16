API-remotes
pull
	
	self pullRemote fetchBranch: self.
	self tracksRemoteBranch
		ifFalse: [ ^ self ].

	self preMerge.
	self repository workingCopy mergeCommit: self trackedBranch commit.