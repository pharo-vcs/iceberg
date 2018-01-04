tests-checkout
testCheckoutCodeRepositoryInstallsCodeInImage

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	
	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: packageName asSymbol.
	
	repository commitWithMessage: message.
	
	repository unload.
	self deny: (RPackageOrganizer default includesPackageNamed: packageName).
	
	repository checkout.
	self assertClassExists: #IceGeneratedClassForTesting.
	self assertPackageExists: packageName.