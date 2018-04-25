tests-queries
testListPackagesListExistingPackage

	| packages |
	packages := self repository workingCopy packageNames.
	self assert: packages size equals: 1.
	self assert: packages first equals: self packageName1