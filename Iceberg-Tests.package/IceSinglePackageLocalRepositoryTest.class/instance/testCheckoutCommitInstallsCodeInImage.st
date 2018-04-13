tests-checkout
testCheckoutCommitInstallsCodeInImage

	| message |
	message := 'Added IceGeneratedClassForTesting'.

	"This is a Ring working copy"
	repository workingCopy
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.

	repository commitWithMessage: message.
	
	repository unload.
	self deny: (RPackageOrganizer default includesPackageNamed: self packageName1).
	
	repository branch commit checkoutAllPackages.
	self assertClassExists: #IceGeneratedClassForTesting.
	self assertPackageExists: self packageName1.