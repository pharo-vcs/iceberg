tests-checkout
testCheckoutCommitInstallsCodeInImage

	| message |
	message := 'Added IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: packageName asSymbol.

	repository commitWithMessage: message.
	
	repository unload.
	self deny: (RPackageOrganizer default includesPackageNamed: packageName).
	
	repository branch commit checkout.
	self assertClassExists: #IceGeneratedClassForTesting.
	self assertPackageExists: packageName.