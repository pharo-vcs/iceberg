accessing
directoryForPackage: mcPackage
	| package |
	package := self frontend packageNamed: mcPackage name.
	^ subdirectory isEmpty
		ifTrue: [ package directoryName ]
		ifFalse: [ subdirectory, '/', package directoryName ]