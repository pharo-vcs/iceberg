private
loadVersionsInBranch: branch
	^ self repository newCommitWalk
		fromBranch: branch;
		versionsFor: self