actions
commitIndexWithMessage: message andParents: parentCommitishList
 	| treeId newCommitId |
	treeId := (self command: 'write-tree') trim.
	
	newCommitId := (self command: 
			{ 'commit-tree' . treeId } ,
			( parentCommitishList flatCollect: [ :parent | { '-p'. parent id } ]), 
			{ '-m'. ('"', (self escapeForShell: message convertToSystemString), '"')}
		) trim.
	
	self command: { 'reset --hard'. newCommitId }.
	^ self headCommit 