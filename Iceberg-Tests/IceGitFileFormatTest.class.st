Class {
	#name : 'IceGitFileFormatTest',
	#superclass : 'IceAbstractTestCase',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceGitFileFormatTest >> newFixture [

	^ IceMultiplePackageFixture inGit
]

{ #category : 'tests' }
IceGitFileFormatTest >> testRepositoryInFileTreeDoesNotSeeFilesCalledAsPackages [

	| fileRef |

	self repository project fileFormat: IceLibgitFiletreeWriter.
	self repository workingCopy refreshPackages.
	self repository workingCopy addPackageNamed: #FileTreePackage.

	fileRef := self repository workingCopy fileSystem / 'NotAPackage.package'.
	fileRef writeStreamDo: [ :str | str nextPutAll: 'Something' ].
	self repository index addPath: 'NotAPackage.package'.

	self repository commitWithMessage: 'Saving Package in Filetree'.

	self assertCollection: (self repository workingCopy packages collect: #name) hasSameElements: { #FileTreePackage }
]

{ #category : 'tests' }
IceGitFileFormatTest >> testRepositoryInFileTreeDoesNotSeeTonelPackages [

	self repository project fileFormat: IceLibgitFiletreeWriter.
	self repository workingCopy refreshPackages.
	self repository workingCopy addPackageNamed: #FileTreePackage.
	self repository commitWithMessage: 'Saving Package in Filetree'.

	self assertCollection: (self repository workingCopy packages collect: #name) hasSameElements: { #FileTreePackage }
]

{ #category : 'tests' }
IceGitFileFormatTest >> testRepositoryWithFilesInUppercaseAreNotRecognizedAsPackages [

	| fileRef |
	
	fileRef := self workingCopy fileSystem / 'README'.
	fileRef writeStreamDo: [ :aStream | aStream nextPutAll: 'Something' ].
	self repository index addPath: 'README'.
	
	self repository commitWithMessage: 'Adding a README file'.
	
	self assertCollection: (self repository workingCopy packages collect: #name) hasSameElements: { self packageName1 asSymbol. self packageName2 asSymbol }
]

{ #category : 'tests' }
IceGitFileFormatTest >> testRepositoryWithFiletreePackageNotRecognizedAsPackages [

	self repository project fileFormat: IceLibgitFiletreeWriter.
	self repository workingCopy refreshPackages.
	self repository workingCopy addPackageNamed: 'FileTreePackage'.
	self repository commitWithMessage: 'Saving Package in Filetree'.

	self repository project fileFormat: IceLibgitTonelWriter.
	self repository commitWithMessage: 'Restoring Tonel format'.

	self assertCollection: (self repository workingCopy packages collect: #name) hasSameElements: { self packageName1 asSymbol. self packageName2 asSymbol }
]
