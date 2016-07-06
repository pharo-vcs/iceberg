private
commitsInCurrentBranchDo: aBlock
	self withRepoDo: [ :repo |
		| walk |
		walk := (LGitRevwalk of: repo)
			pushHead;
			yourself.
			
		[ walk hasNext ] whileTrue: [ 
			| commit |
			commit := walk next.
			aBlock value: commit.
			commit free.
		 ]
	]
