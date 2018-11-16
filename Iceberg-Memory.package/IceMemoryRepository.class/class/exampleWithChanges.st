examples
exampleWithChanges

	| repository anotherPackageName |
	anotherPackageName := 'AnotherNonExistentPackage' asSymbol.
	repository := self exampleWithNoChanges.
	repository workingCopy addPackageNamed: anotherPackageName.
	Object subclass: 'IceGeneratedClassForUI'
		instanceVariableNames: ''
		classVariableNames: ''
		package: anotherPackageName.
	self assert: repository isModified.
	^ repository