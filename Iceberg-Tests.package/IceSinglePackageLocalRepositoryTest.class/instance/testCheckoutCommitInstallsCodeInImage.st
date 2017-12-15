tests-checkout
testCheckoutCommitInstallsCodeInImage

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	Object subclass: 'IceGeneratedClassForTesting'
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName asSymbol.
	repository commitWithMessage: message.
	
	repository unload.
	self deny: (RPackageOrganizer default includesPackageNamed: packageName).
	
	repository branch commit checkout.
	self assert: (Smalltalk globals includesKey: #IceGeneratedClassForTesting).
	self assert: (RPackageOrganizer default includesPackageNamed: packageName)