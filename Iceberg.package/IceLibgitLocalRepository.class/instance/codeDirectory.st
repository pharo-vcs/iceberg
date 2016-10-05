requirements
codeDirectory
	self location exists
		ifFalse: [ IceLocalRepositoryMissing signalFor: self frontend ].
		
	^ self subdirectory isEmptyOrNil 
		ifTrue: [ self location ]
		ifFalse: [ self location / self subdirectory  ].
