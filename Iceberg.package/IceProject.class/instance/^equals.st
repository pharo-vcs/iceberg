comparing
= anotherProject

	self species = anotherProject species ifFalse: [ ^ false ].
	
	commitish = anotherProject commitish ifFalse: [ ^ false ].
	properties = anotherProject properties ifFalse: [ ^ false ].
	repository = anotherProject repository ifFalse: [ ^ false ]. 
	repositoryProperties = anotherProject repositoryProperties ifFalse: [ ^ false ].
	
	^ true.