tests-changes
testCreateClassInImageMakesChangesContainClassDefinition

	| diff |
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: packageName1 asSymbol.

	diff := repository workingCopyDiff.
	self assert: diff tree children size equals: 1.
	self assert: (diff tree / packageName1) children size equals: 1.
	self assert: (diff tree / packageName1 / 'IceGeneratedClassForTesting') value isAddition.
	self assert: (diff tree / packageName1 / 'IceGeneratedClassForTesting') value definition isClassDefinition.
	self assert: (diff tree / packageName1 / 'IceGeneratedClassForTesting') value definition name equals: #IceGeneratedClassForTesting.