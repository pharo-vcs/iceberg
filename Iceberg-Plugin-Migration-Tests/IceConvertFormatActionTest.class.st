Class {
	#name : 'IceConvertFormatActionTest',
	#superclass : 'IceAbstractTestCase',
	#category : 'Iceberg-Plugin-Migration-Tests',
	#package : 'Iceberg-Plugin-Migration-Tests'
}

{ #category : 'tests' }
IceConvertFormatActionTest >> commitProjectFile [

	| change1 change2 |
	self deny: self repository workingCopyDiff isEmpty.
	self assert: self repository workingCopyDiff tree children size equals: 2.
	
	change1 := self repository workingCopyDiff tree children first value.
	self assert: change1 isAddition.
	self assert: change1 definition isFileDefinition.
	self assert: change1 definition name equals: '.project'.
	
	change2 := self repository workingCopyDiff tree children second value.
	self assert: change2 isAddition.
	self assert: change2 definition isFileDefinition.
	self assert: change2 definition name equals: '.properties'.
	
	self repository commitWithMessage: 'Add project file'.
]

{ #category : 'running' }
IceConvertFormatActionTest >> newFixture [
	^ IceBasicRepositoryFixture inGit
]

{ #category : 'tests' }
IceConvertFormatActionTest >> testConvertEmptyRepositoryToFiletree [

	self commitProjectFile.

	IceConvertFormatAction new
		repository: self repository;
		branchName: 'migrate-to-filetree';
		mergeWithCurrentBranch: true;
		format: #filetree;
		execute.
	
	self
		assert: self repository writerClass
		equals: IceLibgitFiletreeWriter
]

{ #category : 'tests' }
IceConvertFormatActionTest >> testConvertEmptyRepositoryToTonel [

	self commitProjectFile.

	IceConvertFormatAction new
		repository: self repository;
		branchName: 'migrate-to-filetree';
		mergeWithCurrentBranch: true;
		format: #tonel;
		execute.
	
	self
		assert: self repository writerClass
		equals: IceLibgitTonelWriter
]

{ #category : 'tests' }
IceConvertFormatActionTest >> testConvertToFiletree [
	self repository properties fileFormat: IceLibgitTonelWriter.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'First commit'.

	self 
		assert: self repository writerClass 
		equals: IceLibgitTonelWriter.
	
	IceConvertFormatAction new
		repository: self repository;
		branchName: 'migrate-to-filetree';
		mergeWithCurrentBranch: true;
		format: #filetree;
		execute.
	
	self
		assert: self repository writerClass
		equals: IceLibgitFiletreeWriter.
	self assert: (self repository headCommit packageNames includes: self packageName1)
]

{ #category : 'tests' }
IceConvertFormatActionTest >> testConvertToFiletreeDoesNotCorruptPropertiesFile [
	self repository properties fileFormat: IceLibgitTonelWriter.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'First commit'.

	self 
		assert: self repository writerClass 
		equals: IceLibgitTonelWriter.
	
	IceConvertFormatAction new
		repository: self repository;
		branchName: 'migrate-to-filetree';
		mergeWithCurrentBranch: true;
		format: #filetree;
		execute.
	
	self
		assert: (STON fromString: (self repository workingCopy fileSystem / '.properties') contents)
		equals: (STON fromString: '{
	#format : #filetree
}')
]

{ #category : 'tests' }
IceConvertFormatActionTest >> testConvertToTonel [
	self repository properties fileFormat: IceLibgitFiletreeWriter.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'First commit'.

	self 
		assert: self repository writerClass 
		equals: IceLibgitFiletreeWriter.
	
	IceConvertFormatAction new
		repository: self repository;
		branchName: 'migrate-to-filetree';
		mergeWithCurrentBranch: true;
		format: #tonel;
		execute.
	
	self
		assert: self repository writerClass
		equals: IceLibgitTonelWriter.
	self assert: (self repository headCommit packageNames includes: self packageName1)
]

{ #category : 'tests' }
IceConvertFormatActionTest >> testConvertToTonelDoesNotCorruptPropertiesFile [
	self repository properties fileFormat: IceLibgitFiletreeWriter.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'First commit'.

	self 
		assert: self repository writerClass 
		equals: IceLibgitFiletreeWriter.
	
	IceConvertFormatAction new
		repository: self repository;
		branchName: 'migrate-to-filetree';
		mergeWithCurrentBranch: true;
		format: #tonel;
		execute.
	
	self
		assert: (STON fromString: (self repository workingCopy fileSystem / '.properties') contents)
		equals: (STON fromString: '{
	#format : #tonel
}')
]

{ #category : 'tests' }
IceConvertFormatActionTest >> testConvertToTonelRemovesFiletreeMetadataFile [
	self repository properties fileFormat: IceLibgitFiletreeWriter.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'IceGeneratedClassForTesting'
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'First commit'.
	
	"Simulate creation of filetree metadatafile"
	(self repository subdirectoryReference / '.filetree') ensureCreateFile.
	self repository addFileToIndex: self repository subdirectoryPath / '.filetree'.
	self repository commitIndexWithMessage: 'Add .filetree file' andParents: { self repository headCommit }.

	self assert: (self repository subdirectoryReference / '.filetree') exists.

	self 
		assert: self repository writerClass 
		equals: IceLibgitFiletreeWriter.
	
	IceConvertFormatAction new
		repository: self repository;
		branchName: 'migrate-to-filetree';
		mergeWithCurrentBranch: true;
		format: #tonel;
		execute.
	
	self deny: (self repository subdirectoryReference / '.filetree') exists
]

{ #category : 'tests' }
IceConvertFormatActionTest >> testConvertToTonelUsesCorrectPackageName [

   	self repository properties fileFormat: IceLibgitFiletreeWriter.
 	self repository workingCopy addPackageNamed: self packageName1.
 	self repository workingCopy
 		createClass: 'IceGeneratedClassForTesting'
 		inPackage: self packageName1 asSymbol
 		with: [ :class | 
 			class superclass name: 'Object'.
 			class category: self packageName1, '-Tagged' ].
 	self repository commitWithMessage: 'First commit'.

   	self 
 		assert: self repository writerClass 
 		equals: IceLibgitFiletreeWriter.

   	IceConvertFormatAction new
 		repository: self repository;
 		branchName: 'migrate-to-filetree';
 		mergeWithCurrentBranch: true;
 		format: #tonel;
 		execute.

   	self
 		assert: self repository writerClass
 		equals: IceLibgitTonelWriter.

   	self assert: (self repository headCommit packageNames includes: self packageName1).
 	self deny: (self repository headCommit packageNames includes: (self packageName1, '-Tagged')) 
]

{ #category : 'tests' }
IceConvertFormatActionTest >> testConvertToTonelUsesCorrectPackageNameWhenMethodExtensions [

   	self repository properties fileFormat: IceLibgitFiletreeWriter.
 	self repository workingCopy addPackageNamed: self packageName1.
 	self repository workingCopy
 		createMethod: 'test ^ 42'
 		tagged: 'Tagged'
 		extendingClass: #Object 
 		inPackage: self packageName1.
 	self repository commitWithMessage: 'First commit'.
 	self repository workingCopy
 		unloadPackageNamed: self packageName1.

   	self 
 		assert: self repository writerClass 
 		equals: IceLibgitFiletreeWriter.

   	IceConvertFormatAction new
 		repository: self repository;
 		branchName: 'migrate-to-filetree';
 		mergeWithCurrentBranch: true;
 		format: #tonel;
 		execute.

   	self
 		assert: self repository writerClass
 		equals: IceLibgitTonelWriter.

   	self assert: (self repository headCommit packageNames includes: self packageName1).
 	self deny: (self repository headCommit packageNames includes: (self packageName1, '-Tagged')) 
]
