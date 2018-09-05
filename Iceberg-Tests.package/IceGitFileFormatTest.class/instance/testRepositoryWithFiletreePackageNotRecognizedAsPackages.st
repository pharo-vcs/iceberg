tests
testRepositoryWithFiletreePackageNotRecognizedAsPackages

	self repository project fileFormat: IceLibgitFiletreeWriter.
	self repository workingCopy refreshPackages.
	self repository workingCopy addPackageNamed: 'FileTreePackage'.
	self repository commitWithMessage: 'Saving Package in Filetree'.

	self repository project fileFormat: IceLibgitTonelWriter.
	self repository commitWithMessage: 'Restoring Tonel format'.

	self assertCollection: (self repository workingCopy packages collect: #name) hasSameElements: { self packageName1 asSymbol. self packageName2 asSymbol }