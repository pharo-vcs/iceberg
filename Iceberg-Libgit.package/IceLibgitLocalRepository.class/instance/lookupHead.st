private
lookupHead
	self withRepoDo: [ :repo | 
		| head |
		head := repo head.
		^ head isBranch 
			ifTrue: [ IceLocalBranch named: head basename inRepository: self frontend ] 
			ifFalse: [ head object asIcebergObjectInRepository: self ] ]