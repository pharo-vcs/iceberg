Class {
	#name : 'IceMetacelloIntegrationWithMissingCloneTest',
	#superclass : 'AbstractIceMetacelloIntegrationTest',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'configuring' }
IceMetacelloIntegrationWithMissingCloneTest >> repositoryName [
	
	^ 'test-project-source-properties-tonel'
]

{ #category : 'running' }
IceMetacelloIntegrationWithMissingCloneTest >> setUp [

	super setUp.
	
	Metacello new
		baseline: 'PharoGitTest';
		repository:'github://pharo-vcs/test-project-source-properties-tonel';
		load.
		
	(IceRepository registry select: [ :e | e name = 'test-project-source-properties-tonel' ])
		do: [ :e | e location ensureDeleteAll ]

	
]

{ #category : 'running' }
IceMetacelloIntegrationWithMissingCloneTest >> tearDown [
	
	(IceRepository registry select: [ :e | e name = 'test-project-with-dep' ]) do: [ :each | each ifNotNil: [ :repo |
		repo unload.
		repo forget.
		repo location ifNotNil: #ensureDeleteAll ] ].

	"Cleanup Metacello registry to avoid conflicts"		
	MetacelloProjectRegistration registry baselineRegistry
		detect: [ :registration | registration projectName = 'TestProjectWithDep' ]
		ifFound: [ :registration | registration unregisterProject ].
	
	super tearDown
]

{ #category : 'tests' }
IceMetacelloIntegrationWithMissingCloneTest >> testMissingRepositoryShouldNotFail [

	Metacello new
		baseline: 'PharoGitTest';
		repository:'github://pharo-vcs/test-project-source-properties-tonel';
		load.
			
]
