tests-changes
testCreateClassInImageMakesChangesContainClassDefinition

	| changes |
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: packageName1 asSymbol.

	changes := repository workingCopyDiff elements first changes.
	self assert: changes size equals: 1.
	self assert: changes first isAddition.
	self assert: changes first definition isClassDefinition.
	self assert: changes first definition className equals: #IceGeneratedClassForTesting.