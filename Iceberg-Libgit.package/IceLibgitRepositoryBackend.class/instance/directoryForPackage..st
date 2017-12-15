actions
directoryForPackage: mcPackage
	| package |
	package := self frontend packageNamed: mcPackage name.
	^ self subdirectory isEmptyOrNil
		ifTrue: [ package directoryName ]
		ifFalse: [ self subdirectory, '/', package directoryName ]