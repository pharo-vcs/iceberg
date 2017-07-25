querying
changedFilesBetween: aCommitish and: otherCommitish
	"Answer a list of files that changed between two commits"
	| fromTree toTree |
	
	self withRepoDo: [ :repo | | diff |
		fromTree := (LGitCommit of: repo fromHexString: aCommitish id) tree.
		toTree := (LGitCommit of: repo fromHexString: otherCommitish id) tree.
		diff := fromTree diffTo: toTree. 
		^ diff files ]