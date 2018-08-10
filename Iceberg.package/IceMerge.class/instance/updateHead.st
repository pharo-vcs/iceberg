executing
updateHead
	" 2 - Update HEAD.
	If the merged commits are from diverging branches, generate a merge commit.
	Then, adopt the commit in
	 - the working copy
	 - the current branch"

	| commitToAdvance |
	commitToAdvance := self isFastForward
		ifTrue: [ "Fast-forward. There is no need to update the working copy in disk.
			Changing the commit in the branch below will checkout the commit in disk."
			repository workingCopy adoptCommit: mergeCommit.
			mergeCommit ]
		ifFalse: [ "Merge case"
			repository workingCopy
				setMergeStateBetweenCommits:
					{self leftCommit.
					mergeCommit}.
			repository workingCopy commitChanges: self withMessage: 'Merge ' , mergeCommit id asString force: true ].
	repository branch commit: commitToAdvance