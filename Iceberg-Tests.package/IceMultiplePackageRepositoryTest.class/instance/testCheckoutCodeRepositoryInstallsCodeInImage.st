tests-checkout
testCheckoutCodeRepositoryInstallsCodeInImage

	| message |
	message := 'Added IceGeneratedClassForTesting'.
	Object subclass: 'IceGeneratedClassForTesting'
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName1 asSymbol.
	repository commitWithMessage: message.

	message := 'Added IceAnotherGeneratedClassForTesting'.
	Object subclass: 'IceAnotherGeneratedClassForTesting'
		instanceVariableNames: ''
		classVariableNames: ''
		package: packageName2 asSymbol.
	repository commitWithMessage: message.
	
	repository unload.
	self deny: (RPackageOrganizer default includesPackageNamed: packageName1).
	self deny: (RPackageOrganizer default includesPackageNamed: packageName2).
	
	repository checkout.
	self assert: (Smalltalk globals includesKey: #IceGeneratedClassForTesting).
	self assert: (Smalltalk globals includesKey: #IceAnotherGeneratedClassForTesting).
	self assert: (RPackageOrganizer default includesPackageNamed: packageName1).
	self assert: (RPackageOrganizer default includesPackageNamed: packageName2)