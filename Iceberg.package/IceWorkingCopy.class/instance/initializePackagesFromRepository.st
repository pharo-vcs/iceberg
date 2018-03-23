initialization
initializePackagesFromRepository
	
	referenceCommit := self repository headCommit.
	referenceCommit packages do: [ :each | self basicAddPackage: each ].