tests-changes
testCreateClassInImageMakesChangesContainClassDefinition

	| changes |
	Object subclass: 'IceGeneratedClassForTesting'
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName asSymbol.

	changes := repository workingCopyDiff elements first changes.
	self assert: changes size equals: 1.
	self assert: changes first isAddition.
	self assert: changes first definition isClassDefinition.
	self assert: changes first definition className equals: #IceGeneratedClassForTesting.