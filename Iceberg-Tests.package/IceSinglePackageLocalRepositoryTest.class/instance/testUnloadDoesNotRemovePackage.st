tests-checkout
testUnloadDoesNotRemovePackage

	| package |
	package := self repository workingCopy packageNamed: self packageName1.
	package unload.
	
	self assert: self repository workingCopyDiff isEmpty