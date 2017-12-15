tests-changes
testCreateClassInImageMakesChangesNonEmpty

	Object subclass: 'IceGeneratedClassForTesting'
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName1 asSymbol.
	self deny: repository workingCopyDiff isEmpty