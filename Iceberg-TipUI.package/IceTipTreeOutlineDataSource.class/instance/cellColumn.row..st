accessing
cellColumn: column row: rowIndex
	| item |
	
	item := self elementAt: rowIndex.
	^ item depth = 0
		ifTrue: [ self newRootCellFor: item ]
		ifFalse: [ self newCellFor: item ]