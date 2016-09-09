actions
commit: versions withMessage: message andMarkAsMerged: aCommitish
	| treeId newCommitId |
	treeId := (self command: 'write-tree') trim.
	
	newCommitId := (self command: {
		'commit-tree'.
		treeId.
		'-p'. self branch.
		'-p'. aCommitish id. 
		'-m'. ('"', (self escapeForShell: message convertToSystemString), '"')
	}) trim.
	
	self command: { 'reset --hard'. newCommitId }.
	self lookupLatestCommitInfo 