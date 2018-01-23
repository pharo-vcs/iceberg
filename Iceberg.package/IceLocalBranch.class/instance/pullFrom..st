API-remotes
pullFrom: aRemote
	
	aRemote fetchBranch: self.
	self tracksRemoteBranch
		ifFalse: [ ^ self ].

	self preMerge.
	self repository workingCopy mergeCommit: self trackedBranch commit.