scenarios
scenarioTwoDirtyPackages
	| testClass newClass |
	repository loadPackageNamed: packageName.
	repository loadPackageNamed: otherPackageName.

	testClass := Smalltalk at: #Test.
	testClass compile: ('newMethod').
	
	newClass := testClass 
		subclass: #IcebergTestClass2 
		instanceVariableNames: '' 
		classVariableNames: '' 
		package: otherPackageName.
	newClass compile: ('newMethod').
	
