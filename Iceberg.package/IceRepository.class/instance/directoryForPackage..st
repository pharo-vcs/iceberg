private
directoryForPackage: mcPackage
	| package |
	package := self packageNamed: mcPackage name.
	^ subdirectory isEmptyOrNil
		ifTrue: [ package directoryName ]
		ifFalse: [ subdirectory, '/', package directoryName ]