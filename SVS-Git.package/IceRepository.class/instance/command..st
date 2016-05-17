repository handling
command: stringOrArrayOfStrings
	| arguments |
	arguments := stringOrArrayOfStrings isString 
		ifTrue: [ ' ' split: stringOrArrayOfStrings ]
		ifFalse: [ stringOrArrayOfStrings ].
	^ MCFileTreeGitRepository 
		runGitCommand: arguments 
		in: self repository directory