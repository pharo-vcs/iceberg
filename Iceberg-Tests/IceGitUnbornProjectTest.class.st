Class {
	#name : 'IceGitUnbornProjectTest',
	#superclass : 'IceAbstractTestCase',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceGitUnbornProjectTest >> newFixture [

	^ IceUnbornProjectFixture inGit
]

{ #category : 'tests' }
IceGitUnbornProjectTest >> testCommitNewProjectCreatesProjectFile [

	self repository workingCopy project: (IceBasicProject onRepository: self repository withSourceDirectory: fixture subdirectory).
	self repository commitWithMessage: 'Create project file'.
	self assert: (self repository headCommit fileSystem / '.project') exists
]

{ #category : 'tests' }
IceGitUnbornProjectTest >> testCommitNewProjectFindsPropertiesFile [

	self repository workingCopy project: (IceBasicProject onRepository: self repository withSourceDirectory: fixture subdirectory).
	self repository commitWithMessage: 'Create project file'.
	
	self assert: (self repository headCommit fileSystem resolve: self repository properties propertiesFilePath) exists
]

{ #category : 'tests' }
IceGitUnbornProjectTest >> testDiffContainsNewProject [

	| diff |
	self repository workingCopy project: (IceBasicProject onRepository: self repository withSourceDirectory: fixture subdirectory).
	
	diff := self repository workingCopyDiff.
	self assert: (diff tree / '.project') value isAddition
]

{ #category : 'tests' }
IceGitUnbornProjectTest >> testInvalidProjectReturnsSameSourceDirectoryThanCurrentProject [

	"Create a new commit"
	self repository workingCopy
		addPackageNamed: self packageName1 asSymbol;
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.	
	self repository commitWithMessage: 'Another Invalid project commit'.

	self assert: self repository headCommit parent project isInvalid
]

{ #category : 'tests' }
IceGitUnbornProjectTest >> testProjectCurrentCommitAfterChangeIsUnborn [

	"Create a new commit"
	self repository workingCopy
		addPackageNamed: self packageName1 asSymbol;
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.
	self repository commitWithMessage: 'Another Invalid project commit'.

	self assert: self repository workingCopy project isUnborn.
	self assert: self repository headCommit project isInvalid.
]

{ #category : 'tests' }
IceGitUnbornProjectTest >> testProjectIsUnborn [

	self assert: self repository project isUnborn
]

{ #category : 'tests' }
IceGitUnbornProjectTest >> testProjectOlderCommitIsInvalid [

	"Create a new commit"
	self repository workingCopy
		addPackageNamed: self packageName1 asSymbol;
		createClass: 'IceGeneratedClassForTesting' 
		inPackage: self packageName1 asSymbol.	
	self repository commitWithMessage: 'Another Invalid project commit'.

	self repository workingCopy project: (IceBasicProject onRepository: self repository withSourceDirectory: 'test').
	self assert: self repository headCommit parent project sourceDirectory equals: 'test'
]

{ #category : 'tests' }
IceGitUnbornProjectTest >> testPropertiesFileIsNotEmpty [

	| props |
	props := STON fromStream: (self repository workingCopy fileSystem / '.properties') readStream.
	self assert: (props includesKey: #format)
	
	
	
]

{ #category : 'tests' }
IceGitUnbornProjectTest >> testRepositoryHasNoProjectFile [

	self deny: (self repository location / '.project') exists
]
