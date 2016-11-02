private
lookupHead
	self withRepoDo: [ :repo | 
		| head |
		head := repo head.
		^ head isBranch
			ifTrue: [ IceBranch named: self currentBranch inRepository: self frontend ]
			ifFalse: [ self iceCommitFromReference: head ]
	]
