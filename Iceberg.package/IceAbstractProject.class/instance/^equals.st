comparing
= anotherProject

	self species = anotherProject species ifFalse: [ ^ false ].
	self repository = anotherProject repository ifFalse: [ ^ false ]. 
	self properties = anotherProject properties ifFalse: [ ^ false ].
	^ true.