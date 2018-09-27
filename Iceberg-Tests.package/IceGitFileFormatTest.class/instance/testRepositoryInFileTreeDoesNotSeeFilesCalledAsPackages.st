tests
testRepositoryInFileTreeDoesNotSeeFilesCalledAsPackages

	| fileRef |

	self repository project fileFormat: IceLibgitFiletreeWriter.
	self repository workingCopy refreshPackages.
	self repository workingCopy addPackageNamed: #FileTreePackage.

	fileRef := self repository workingCopy fileSystem / 'NotAPackage.package'.
	fileRef writeStreamDo: [ :str | str nextPutAll: 'Something' ].
	self repository index addPath: 'NotAPackage.package'.

	self repository commitWithMessage: 'Saving Package in Filetree'.

	self assertCollection: (self repository workingCopy packages collect: #name) hasSameElements: { #FileTreePackage }