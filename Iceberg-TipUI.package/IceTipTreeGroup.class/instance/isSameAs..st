testing
isSameAs: aNode
	^ aNode species = self species 
		and: [ self name = aNode name
		and: [ aNode name notNil ] ]