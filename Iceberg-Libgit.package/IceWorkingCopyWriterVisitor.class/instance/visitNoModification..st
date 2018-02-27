visiting
visitNoModification: anIceNoModification 
	
	"I may have no changes, but my children may"
	currentNode hasChanges ifTrue: [
		anIceNoModification definition accept: self ].