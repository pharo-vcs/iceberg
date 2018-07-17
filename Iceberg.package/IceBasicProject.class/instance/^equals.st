comparing
= anotherProject

	self species = anotherProject species ifFalse: [ ^ false ].
	properties = anotherProject properties ifFalse: [ ^ false ].
	self repository = anotherProject repository ifFalse: [ ^ false ]. 

	^ true.