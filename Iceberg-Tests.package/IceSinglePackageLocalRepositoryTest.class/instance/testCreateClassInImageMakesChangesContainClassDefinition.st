tests-changes
testCreateClassInImageMakesChangesContainClassDefinition

	| diff |
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: packageName asSymbol.

	diff := repository workingCopyDiff.
	self assert: diff tree children size equals: 1.
	self assert: (diff tree / packageName) children size equals: 1.
	self assert: (diff tree / packageName / 'IceGeneratedClassForTesting') value isAddition.
	self assert: (diff tree / packageName / 'IceGeneratedClassForTesting') value definition isClassDefinition.
	self assert: (diff tree / packageName / 'IceGeneratedClassForTesting') value definition name equals: #IceGeneratedClassForTesting.