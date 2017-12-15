tests-changes
testCreateClassInImageMakesRespositoryModifications

	Object subclass: 'IceGeneratedClassForTesting'
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName1 asSymbol.
	self assert: repository isModified