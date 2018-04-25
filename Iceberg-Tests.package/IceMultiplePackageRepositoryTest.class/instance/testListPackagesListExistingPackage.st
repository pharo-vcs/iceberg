tests-queries
testListPackagesListExistingPackage

	| packages |
	packages := self repository workingCopy packageNames.
	self assert: packages size equals: 2.
	self assert: (packages includes: self packageName1).
	self assert: (packages includes: self packageName2).