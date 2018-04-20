tests
testPackageIsNotDirty

	"There is no difference between the code in the image and the checkout'd code"
	self deny: self repository workingCopy isModified