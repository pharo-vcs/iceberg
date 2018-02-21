operations
simmetricDifference: aNode
	
	| valueDiff newNode |
	valueDiff := (self basicEqualsTo: aNode)
		ifTrue: [ IceNoModification definition: self value ]
		ifFalse: [ IceModification from: aNode value to: self value ].
	
	newNode := IceNode
		value: valueDiff.
		
	self keysDo: [ :key |
		(aNode includesKey: key)
			ifTrue:  [ 
				((self / key) simmetricDifference: (aNode / key)) addTo: newNode ]
			ifFalse: [ 
				newNode addNode: ((self / key) asAddition) ] ].

	aNode keysDo: [ :key |
		(self includesKey: key)
			ifFalse: [ 
				newNode addNode: ((aNode / key) asRemoval) ] ].
			
	^ newNode hasChanges
		ifFalse: [ IceEmptyNode new ]
		ifTrue: [ newNode ]