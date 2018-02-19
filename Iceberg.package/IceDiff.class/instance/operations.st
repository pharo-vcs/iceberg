accessing
operations

	| allOperations |
	allOperations := Set new.
	operations keysAndValuesDo: [ :node :subops | 
		subops do: [ :e | 
			allOperations add: (e asIceOperationOn: node diff: self) ] ].
	^ allOperations