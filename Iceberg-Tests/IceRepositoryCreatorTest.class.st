"
I test that IceRepositoryCreator clones a repository at the commitish it is given.
I clone a local source repository created in setUp, so I do not need the network.
"
Class {
	#name : 'IceRepositoryCreatorTest',
	#superclass : 'TestCase',
	#instVars : [
		'repository',
		'factory',
		'sourceRepository'
	],
	#category : 'Iceberg-Tests-Core-Remotes',
	#package : 'Iceberg-Tests',
	#tag : 'Core-Remotes'
}

{ #category : 'helpers' }
IceRepositoryCreatorTest >> newSourceRepository [
	"Answer a local repository to clone, whose HEAD is on master while the branch forBecomeWritable holds another commit"

	| source |
	source := factory newRepositoryNamed: self sourceRepositoryName withSubdirectory: ''.
	source workingCopy addPackageNamed: 'IceRepositoryCreatorTestPackage'.
	source commitWithMessage: 'Initial commit'.
	source
		createBranch: 'forBecomeWritable';
		checkoutBranch: 'forBecomeWritable'.
	source workingCopy addPackageNamed: 'IceRepositoryCreatorTestOtherPackage'.
	source
		commitWithMessage: 'Commit on forBecomeWritable';
		checkoutBranch: 'master'.
	^ source
]

{ #category : 'accessing' }
IceRepositoryCreatorTest >> repositoryLocation [

	^ FileLocator imageDirectory / 'test-ice-repository-creator'
]

{ #category : 'running' }
IceRepositoryCreatorTest >> setUp [

	super setUp.
	factory := IceGitTestFactory new.

	"On Windows, the pack file of the clone stays open after the repository is freed, so tearDown cannot delete it."
	OSPlatform current isWindows ifTrue: [ self skipOnPharoCITestingEnvironment ].
	sourceRepository := self newSourceRepository
]

{ #category : 'accessing' }
IceRepositoryCreatorTest >> sourceRepositoryName [

	^ 'test-ice-repository-creator-source'
]

{ #category : 'running' }
IceRepositoryCreatorTest >> tearDown [
	"Free the repositories first: on Windows, their files cannot be deleted while libgit2 keeps them open."

	repository ifNotNil: [ repository free ].
	sourceRepository ifNotNil: [ sourceRepository free ].
	factory ensureDeleteAll: self repositoryLocation.
	factory ensureDeleteAll: factory location / self sourceRepositoryName.
	super tearDown
]

{ #category : 'tests' }
IceRepositoryCreatorTest >> testClonedRepositoryIsClonedAtRightCommitish [

	repository := IceRepositoryCreator new
		              location: self repositoryLocation;
		              url: sourceRepository location resolve asZnUrl asString;
		              commitishName: 'forBecomeWritable';
		              createRepository;
		              repository.

	self assert: sourceRepository head name equals: 'master'.
	self assert: repository head name equals: 'forBecomeWritable'.
	self assert: repository head commit comment equals: 'Commit on forBecomeWritable'
]
