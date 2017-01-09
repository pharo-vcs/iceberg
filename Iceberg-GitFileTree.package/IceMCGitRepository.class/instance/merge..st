actions
merge: commitId 
	"Try a basic merge delegating to the external repo (e.g. git).
	If impossible, abort and signal IceMergeAborted, 
	meaning that the caller will have to merge manually."
	
	[ self command: { 'merge'. commitId . '-m'. '"Merge commit {1}"' format: { commitId }} ] 
		on: MCFileTreeGitError
		do: [ 
			self command: 'merge --abort'.
			IceMergeAborted signal.
		]
