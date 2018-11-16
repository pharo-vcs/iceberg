tests
commitProjectFile

	| change1 change2 |
	self deny: self repository workingCopyDiff isEmpty.
	self assert: self repository workingCopyDiff tree children size equals: 2.
	
	change1 := self repository workingCopyDiff tree children first value.
	self assert: change1 isAddition.
	self assert: change1 definition isFileDefinition.
	self assert: change1 definition name equals: '.project'.
	
	change2 := self repository workingCopyDiff tree children second value.
	self assert: change2 isAddition.
	self assert: change2 definition isFileDefinition.
	self assert: change2 definition name equals: '.properties'.
	
	self repository commitWithMessage: 'Add project file'.