tests-checkout
testCheckoutBranchInstallsCodeInImage

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: packageName asSymbol.
	
	repository commitWithMessage: message.
	
	repository unload.
	self denyPackageExists: packageName.
	
	repository branch checkout.
	self assertClassExists: #IceGeneratedClassForTesting.
	self assertPackageExists: packageName.