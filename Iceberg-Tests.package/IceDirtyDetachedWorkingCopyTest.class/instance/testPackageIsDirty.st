tests
testPackageIsDirty

	"There are uncommited changes"
	self assert: self repository workingCopy isModified