accessing
sourceVersionOf: aNode
	
	| nodeOperations |
	nodeOperations := operations at: aNode description ifAbsent: [ ^ '' ].
	nodeOperations size = 1 ifTrue: [ ^ nodeOperations anyOne diffToSource ].
	self halt.