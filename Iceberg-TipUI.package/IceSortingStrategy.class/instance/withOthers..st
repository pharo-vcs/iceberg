accessing
withOthers: aSymbol 
	self first = aSymbol ifTrue: [ self first: nil ].
	self last = aSymbol ifTrue: [ self last: nil ]