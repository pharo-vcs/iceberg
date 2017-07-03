querying
changedFilesBetween: aCommitish and: otherCommitish
	"Answer a list of files that changed between two commits"
	| fromTree toTree |
	
	self withRepoDo: [ :repo | | diff |
		fromTree := (LGitCommit of: repo fromId: (LGitId fromHexString: aCommitish id)) tree.
		toTree := (LGitCommit of: repo fromId: (LGitId fromHexString: otherCommitish id)) tree.
		
		diff := LGitDiff of: repo.
		diff diffTree: fromTree toTree: toTree. 
		^ diff files ]