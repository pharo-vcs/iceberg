tests
testRepositoryInFileTreeDoesNotSeeTonelPackages

	self repository project fileFormat: IceLibgitFiletreeWriter.
	self repository workingCopy refreshPackages.
	self repository workingCopy addPackageNamed: #FileTreePackage.
	self repository commitWithMessage: 'Saving Package in Filetree'.

	self assertCollection: (self repository workingCopy packages collect: #name) hasSameElements: { #FileTreePackage }