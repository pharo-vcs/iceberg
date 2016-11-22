printing
shortName
	^ (self value respondsTo: #shortName)
		ifTrue: [ self value shortName ]
		ifFalse: [ self value printString ]