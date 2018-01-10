scenarios
scenarioTwoDirtyPackages
	| testClass newClass |
	repository checkoutPackageNamed: packageName.
	repository checkoutPackageNamed: otherPackageName.

	testClass := Smalltalk at: #Test.
	testClass compile: ('newMethod').
	
	newClass := testClass 
		subclass: #IcebergTestClass2 
		instanceVariableNames: '' 
		classVariableNames: '' 
		package: otherPackageName.
	newClass compile: ('newMethod').
	
