execute
in: directory executeCommand: stringOrArrayOfStrings
	| arguments |
	arguments := stringOrArrayOfStrings isString 
		ifTrue: [ ' ' split: stringOrArrayOfStrings ]
		ifFalse: [ stringOrArrayOfStrings ].
	^ MCFileTreeGitRepository 
		runGitCommand: arguments 
		in: directory