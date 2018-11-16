tests-checkout
testCheckoutBranchInstallsCodeInImage

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	
	self repository commitWithMessage: message.
	
	self repository unload.
	self denyPackageExists: self packageName1.
	
	self repository branch checkoutAllPackages.
	self assertClassExists: #IceGeneratedClassForTesting.
	self assertPackageExists: self packageName1.