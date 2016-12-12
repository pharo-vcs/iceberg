private
rawResultsDo: aBlock
	| currentResult |
	currentResult := nil.

	(self repository command: self buildCommand) linesDo: [ :line |
		(line beginsWith: '|')
			ifTrue:  [ 
				currentResult ifNotNil: [ aBlock value: currentResult contents ].
				currentResult := WriteStream with: line ]
			ifFalse: [ 
				currentResult cr; nextPutAll: line ]].

	currentResult ifNotNil: [ aBlock value: currentResult contents ].
