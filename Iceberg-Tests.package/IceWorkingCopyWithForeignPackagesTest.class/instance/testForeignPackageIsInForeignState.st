tests
testForeignPackageIsInForeignState

	self assert: (repository packageNamed: packageName1) packageState isForeignPackageState