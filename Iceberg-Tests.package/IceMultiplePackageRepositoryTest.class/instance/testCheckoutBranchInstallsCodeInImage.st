tests-checkout
testCheckoutBranchInstallsCodeInImage

	| message |
	message := 'Added IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	repository commitWithMessage: message.

	message := 'Added IceAnotherGeneratedClassForTesting'.
	
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: self packageName2 asSymbol.
	repository commitWithMessage: message.

	repository unload.
	self denyPackageExists: self packageName1.
	self denyPackageExists: self packageName2.
	
	repository branch checkoutAllPackages.
	self assertClassExists: #IceGeneratedClassForTesting.
	self assertClassExists: #IceAnotherGeneratedClassForTesting.
	self assertPackageExists: self packageName1.
	self assertPackageExists: self packageName2