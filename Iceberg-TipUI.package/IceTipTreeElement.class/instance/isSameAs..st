testing
isSameAs: aNode
	^ aNode species = self species 
		and: [ self model = aNode model ]