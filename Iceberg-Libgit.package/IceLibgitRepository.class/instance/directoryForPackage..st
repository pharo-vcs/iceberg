API-packages
directoryForPackage: mcPackage
	| package |
	package := self packageNamed: mcPackage name.
	^ self subdirectory isEmptyOrNil
		ifTrue: [ self directoryNameForPackage: package ]
		ifFalse: [ self subdirectory, '/', (self directoryNameForPackage: package) ]