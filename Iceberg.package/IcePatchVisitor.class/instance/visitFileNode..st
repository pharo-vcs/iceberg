visiting
visitFileNode: anIceFileNode 
	
	| node |
	node := merge root ensureNode: anIceFileNode.
	diff
		operationForNode: anIceFileNode
		ifPresent: [ :operation | 1halt ].
	"merge addOperation: () forNode: "