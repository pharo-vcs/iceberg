tests
testRepositoryWithFilesInUppercaseAreNotRecognizedAsPackages

	| fileRef |
	
	fileRef := self workingCopy fileSystem / 'README'.
	fileRef writeStreamDo: [ :aStream | aStream nextPutAll: 'Something' ].
	self repository index addPath: 'README'.
	
	self repository commitWithMessage: 'Adding a README file'.
	
	self assertCollection: (self repository workingCopy packages collect: #name) hasSameElements: { self packageName1 asSymbol. self packageName2 asSymbol }