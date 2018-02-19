accessing
targetVersionOf: aNode
	
	| nodeOperations |
	nodeOperations := operations at: aNode ifAbsent: [ ^ '' ].
	nodeOperations size = 1 ifTrue: [ ^ nodeOperations anyOne diffFromSource ].
	self halt.