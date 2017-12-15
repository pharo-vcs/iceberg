private
lookupHead
	self withRepoDo: [ :repo | 
		| head |
		repo isUnborn ifTrue: [ 
			^ IceOldUnbornBranch inRepository: self frontend ].
		head := repo head.
		^ head isBranch 
			ifTrue: [ IceOldLocalBranch named: head name inRepository: self frontend ] 
			ifFalse: [ head object asIcebergObjectInRepository: self ] ]