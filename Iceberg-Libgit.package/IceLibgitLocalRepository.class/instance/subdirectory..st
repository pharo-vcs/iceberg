subdirectories
subdirectory: anObject

	"compatibility with the old API with only one subdirectory"
	
	(self subdirectories size = 1) ifTrue: [ 
		"change the existing subdirectory"
		self subdirectories removeAll.
		self addSubdirectory: anObject.
		^ self ].
	
	self subdirectories isEmpty ifTrue: [ 
		self addSubdirectory: anObject.
		^ self ].
	
	self error: 'Subdirectory cannot be changed because the repository contains more of them'