requirements
codeDirectory
	^ self subdirectory isEmptyOrNil 
		ifTrue: [ self location ]
		ifFalse: [ self location / self subdirectory  ]