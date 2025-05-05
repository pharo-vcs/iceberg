Class {
	#name : 'IceRepositoryCreatorTest',
	#superclass : 'TestCase',
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

	self repositoryLocation ensureDeleteAll.
	
	super tearDown.
]

{ #category : 'tests' }
IceRepositoryCreatorTest >> testClonedRepositoryIsClonedAtRightCommitish [

	| repository url |
	
	url := 'https://github.com/pharo-vcs/{1}.git' 
				format: { IceMetacelloNoProjectSourcePropertiesFiletreeTest new repositoryName }.
	repository := IceRepositoryCreator new
		location: self repositoryLocation;
		url: url;
		commitishName: 'forBecomeWritable';
		createRepository;
		repository.
		
	self assert: repository head name equals: 'forBecomeWritable'
]
