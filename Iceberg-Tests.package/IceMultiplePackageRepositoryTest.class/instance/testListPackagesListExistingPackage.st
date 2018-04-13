tests-queries
testListPackagesListExistingPackage

	| packages |
	packages := repository workingCopy packageNames.
	self assert: packages size equals: 2.
	self assert: (packages includes: self packageName1).
	self assert: (packages includes: self packageName2).