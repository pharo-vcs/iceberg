private
lookupHead
	self withRepoDo: [ :repo | 
		| head |
		[ head := repo head ] 
			on: LGit_GIT_EUNBORNBRANCH 
			do: [ ^ IceUnbornBranch new ].
			
		^ head isBranch 
			ifTrue: [ IceBranch named: self currentBranch inRepository: self frontend ] 
			ifFalse: [ self revparse: branch ]
	]
