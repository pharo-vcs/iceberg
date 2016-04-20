repository handling
command: stringOrArrayOfStrings
	| arguments |
	arguments := stringOrArrayOfStrings isString 
		ifTrue: [ ' ' split: stringOrArrayOfStrings ]
		ifFalse: [ stringOrArrayOfStrings ].
	^ self repository 
		gitCommand: arguments 
		in: self repository directory