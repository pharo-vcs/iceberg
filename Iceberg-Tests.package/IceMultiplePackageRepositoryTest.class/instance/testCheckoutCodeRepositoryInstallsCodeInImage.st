tests-checkout
testCheckoutCodeRepositoryInstallsCodeInImage

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: message.

	message := 'Added IceAnotherGeneratedClassForTesting'.
	"This is a Ring working copy"
	self repository workingCopy
		createClass: 'IceAnotherGeneratedClassForTesting' 
		inPackage: self packageName2 asSymbol.
	self repository commitWithMessage: message.
	
	self repository unload.
	self denyPackageExists: self packageName1.
	self denyPackageExists: self packageName2.
	
	self repository checkoutAllPackages.
	self assertClassExists: #IceGeneratedClassForTesting.
	self assertClassExists: #IceAnotherGeneratedClassForTesting.
	self assertPackageExists: self packageName1.
	self assertPackageExists: self packageName2