tests-checkout
testCheckoutCodeRepositoryInstallsCodeInImage

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	Object subclass: 'IceGeneratedClassForTesting'
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName asSymbol.
	repository commitWithMessage: message.
	
	repository unload.
	self deny: (RPackageOrganizer default includesPackageNamed: packageName).
	
	repository checkout.
	self assert: (Smalltalk globals includesKey: #IceGeneratedClassForTesting).
	self assert: (RPackageOrganizer default includesPackageNamed: packageName)