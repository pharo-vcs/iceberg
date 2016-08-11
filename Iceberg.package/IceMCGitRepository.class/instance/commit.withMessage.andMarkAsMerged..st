actions
commit: versions withMessage: message andMarkAsMerged: aCommitish
	| treeId headCommitId newCommitId |
	self halt.
	treeId := (self command: 'write-tree') trim.
	headCommitId := (self command: 'rev-parse HEAD') trim.
	
	newCommitId := (self command: {
		'commit-tree'.
		treeId.
		'-p'. self branch.
		'-p'. aCommitish id. 
		'-m'. (self escapeForShell: message convertToSystemString)
	}) trim.
	
	self command: { 'reset --hard'. newCommitId }
