ui
iconFor: anIceNode 
	
"	| nodeOperations |"
	^ Smalltalk ui icons iconNamed: #emptyPackage
	"nodeOperations := (operations at: anIceNode description ifAbsent: [ { anIceNode } ]).
	nodeOperations size = 1
		ifTrue: [ ^ nodeOperations anyOne icon ].
	
	self flag: #strange.
	^ nodeOperations anyOne icon"