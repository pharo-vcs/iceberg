Class {
	#name : #IceMetacelloIntegrationWithMissingClone,
	#superclass : #AbstractIceMetacelloIntegrationTests,
	#category : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : #configuring }
IceMetacelloIntegrationWithMissingClone >> repositoryName [
	
	^ 'test-project-source-properties-tonel'
]

{ #category : #tests }
IceMetacelloIntegrationWithMissingClone >> setUp [

	super setUp.
	
	Metacello new
		baseline: 'PharoGitTest';
		repository:'github://pharo-vcs/test-project-source-properties-tonel';
		load.
		
	(IceRepository registry select: [ :e | e name = 'test-project-source-properties-tonel' ])
		do: [ :e | e location ensureDeleteAll ]

	
]

{ #category : #tests }
IceMetacelloIntegrationWithMissingClone >> tearDown [

	super tearDown.
	
	(IceRepository registry select: [ :e | e name = 'test-project-with-dep' ]) do: [ :each | each ifNotNil: [ :repo |
		repo unload.
		repo forget.
		repo location ifNotNil: #ensureDeleteAll ] ].

	"Cleanup Metacello registry to avoid conflicts"		
	MetacelloProjectRegistration registry baselineRegistry
		detect: [ :registration | registration projectName = 'TestProjectWithDep' ]
		ifFound: [ :registration | registration unregisterProject ].
	
]

{ #category : #tests }
IceMetacelloIntegrationWithMissingClone >> testMissingRepositoryShouldNotFail [

	Metacello new
		baseline: 'PharoGitTest';
		repository:'github://pharo-vcs/test-project-source-properties-tonel';
		load.
			
]
