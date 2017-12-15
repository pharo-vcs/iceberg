walk definition
fromBranch: branch
	[ self revwalk pushReference: (lgitRepository lookupBranch: (branch isRemote ifTrue: [branch fullname] ifFalse: [ branch shortname ]) remote: branch isRemote) ]
		on: LGit_GIT_EINVALIDSPEC do: [
			"branch real branch, so try to find a corresponding treeish using revparse, 
			this will handle stuff like 'master~1'"
			self fromLGitId: (lgitRepository revparse: branch name) id
		]

