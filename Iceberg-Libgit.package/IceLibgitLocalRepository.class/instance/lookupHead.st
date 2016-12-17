private
lookupHead
	self withRepoDo: [ :repo | 
		| head |
		head := repo head.
		^ head isBranch 
			ifTrue: [ IceLocalBranch named: head basename inRepository: self frontend ] 
			ifFalse: [ self revparse: branch name ] ]