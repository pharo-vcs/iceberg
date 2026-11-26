Class {
	#name : 'IceRepositoryCreatorTest',
	#superclass : 'TestCase',
	#instVars : [
		'repository'
	],
	#category : 'Iceberg-Tests-Core-Remotes',
	#package : 'Iceberg-Tests',
	#tag : 'Core-Remotes'
}

{ #category : 'accessing' }
IceRepositoryCreatorTest >> repositoryLocation [

	^ FileLocator imageDirectory / 'test-ice-repository-creator'
]

{ #category : 'running' }
IceRepositoryCreatorTest >> tearDown [
	"Free the cloned repository first: on Windows, its files cannot be deleted while libgit2 keeps them open."

	repository ifNotNil: [ repository free ].
	self repositoryLocation ensureDeleteAll.
	super tearDown
]

{ #category : 'tests' }
IceRepositoryCreatorTest >> testClonedRepositoryIsClonedAtRightCommitish [

	| url |
	url := 'https://github.com/pharo-vcs/{1}.git' format: { IceMetacelloNoProjectSourcePropertiesFiletreeTest new repositoryName }.
	repository := IceRepositoryCreator new
		              location: self repositoryLocation;
		              url: url;
		              commitishName: 'forBecomeWritable';
		              createRepository;
		              repository.

	self assert: repository head name equals: 'forBecomeWritable'
]
