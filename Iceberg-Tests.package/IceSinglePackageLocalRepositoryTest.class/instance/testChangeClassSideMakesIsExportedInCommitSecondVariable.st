tests-changes
testChangeClassSideMakesIsExportedInCommitSecondVariable

	| diff |
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	self repository commitWithMessage: 'First class'.

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class metaclass instanceVariables: #(someClassInstVar) ].

	self repository commitWithMessage: 'Added class instance variable'.	

	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol
		with: [ :class | class metaclass instanceVariables: #(someClassInstVar anotherClassInstVar) ].

	self repository commitWithMessage: 'Added another class instance variable'.

	diff := self repository headCommit diffToParent.
	self assert: diff codeSubdirectoryNode children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1) children size equals: 1.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value isModification.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition isClassDefinition.
	self assert: (diff codeSubdirectoryNode / self packageName1 / 'IceGeneratedClassForTesting class') value definition name equals: #'IceGeneratedClassForTesting class'.