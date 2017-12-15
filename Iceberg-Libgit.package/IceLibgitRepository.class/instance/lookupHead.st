accessing
lookupHead
	self withRepoDo: [ :repo | 
		| head |
		repo isUnborn ifTrue: [ 
			^ IceUnbornBranch inRepository: self ].
		head := repo head.
		^ head isBranch 
			ifTrue: [ self basicNewBranchNamed: head name ] 
			ifFalse: [ head object asIcebergObjectInRepository: self ] ]