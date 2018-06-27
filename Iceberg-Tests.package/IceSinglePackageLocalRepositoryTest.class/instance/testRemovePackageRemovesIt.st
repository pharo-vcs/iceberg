tests-checkout
testRemovePackageRemovesIt

	| package |
	package := self repository workingCopy packageNamed: self packageName1.
	package remove.
	
	self assert: (self repository workingCopyDiff codeSubdirectoryNode / self packageName1) value isRemoval