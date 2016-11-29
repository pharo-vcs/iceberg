querying
allBranchNames
	^  (self command: 'branch -a') lines collect: [ :line | 
			(line allButFirst: 2) withoutPrefix: 'remotes/' ]
