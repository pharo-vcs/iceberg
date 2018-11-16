comparing
= another
	self species = another species ifFalse: [ ^ false ].
	
	"If I both load commits are equal, we are the same version."
	^ self commit = another commit