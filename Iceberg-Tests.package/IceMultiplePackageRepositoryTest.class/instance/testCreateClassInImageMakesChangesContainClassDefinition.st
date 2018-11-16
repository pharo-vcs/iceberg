tests-changes
testCreateClassInImageMakesChangesContainClassDefinition

	| diff |
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	diff := self repository workingCopyDiff.
	self assert: diff tree children size equals: 1.
	self assert: (diff tree / self packageName1) children size equals: 1.
	self assert: (diff tree / self packageName1 / 'IceGeneratedClassForTesting') value isAddition.
	self assert: (diff tree / self packageName1 / 'IceGeneratedClassForTesting') value definition isClassDefinition.
	self assert: (diff tree / self packageName1 / 'IceGeneratedClassForTesting') value definition name equals: #IceGeneratedClassForTesting.