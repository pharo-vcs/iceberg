tests-changes
testCreateClassInImageMakesChangesNonEmpty

	Object subclass: 'IceGeneratedClassForTesting'
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName asSymbol.
	self deny: repository workingCopyDiff isEmpty