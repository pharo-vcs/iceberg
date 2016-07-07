private
commitsInCurrentBranchDo: aBlock
	self withRepoDo: [ :repo |
		| walk |
		walk := (LGitRevwalk of: repo)
			pushHead;
			yourself.
			
		[ walk hasNext ] whileTrue: [ 
			aBlock value: walk next
		]
	]
