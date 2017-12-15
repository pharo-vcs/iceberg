tests-changes
testCreateClassInImageMakesRespositoryModifications

	Object subclass: 'IceGeneratedClassForTesting'
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName asSymbol.
	self assert: repository isModified