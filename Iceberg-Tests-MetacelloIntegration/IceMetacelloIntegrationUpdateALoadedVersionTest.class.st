Class {
	#name : 'IceMetacelloIntegrationUpdateALoadedVersionTest',
	#superclass : 'AbstractIceMetacelloIntegrationTest',
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'configuring' }
IceMetacelloIntegrationUpdateALoadedVersionTest >> repositoryName [
	
	^ 'test-project-source-properties-tonel'
]

{ #category : 'running' }
IceMetacelloIntegrationUpdateALoadedVersionTest >> tearDown [
	
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
IceMetacelloIntegrationUpdateALoadedVersionTest >> testConflictDetectedWithProjectWithDependency [

	Metacello new
		baseline: 'PharoGitTest';
		repository:'github://pharo-vcs/test-project-source-properties-tonel';
		load.

	self assert: self repositoryForTest head description equals: 'master'.
	self assert: (Smalltalk classNamed: #Test) new versionNumber equals: 700.

	self should: [Metacello new
		baseline: 'TestProjectWithDep';
		repository:'github://pharo-vcs/test-project-with-dep';
		load] raise: MetacelloConflictingProjectError.
			
]

{ #category : 'tests' }
IceMetacelloIntegrationUpdateALoadedVersionTest >> testIncommingWhenProjectWithDependency [

	Metacello new
		baseline: 'PharoGitTest';
		repository:'github://pharo-vcs/test-project-source-properties-tonel';
		load.

	self assert: self repositoryForTest head description equals: 'master'.
	self assert: (Smalltalk classNamed: #Test) new versionNumber equals: 700.

	Metacello new
		baseline: 'TestProjectWithDep';
		repository:'github://pharo-vcs/test-project-with-dep';
		onConflictUseIncoming;
		load.
		
	self assert: self repositoryForTest head description equals: '1.2.3'.
	self assert: (Smalltalk classNamed: #Test) new versionNumber equals: 697.
	
]

{ #category : 'tests' }
IceMetacelloIntegrationUpdateALoadedVersionTest >> testKeepExistingWhenProjectWithDependency [

	Metacello new
		baseline: 'PharoGitTest';
		repository:'github://pharo-vcs/test-project-source-properties-tonel';
		load.

	self assert: self repositoryForTest head description equals: 'master'.
	self assert: (Smalltalk classNamed: #Test) new versionNumber equals: 700.

	Metacello new
		baseline: 'TestProjectWithDep';
		repository:'github://pharo-vcs/test-project-with-dep';
		onConflictUseLoaded;
		load.
		
	self assert: self repositoryForTest head description equals: 'master'.
	self assert: (Smalltalk classNamed: #Test) new versionNumber equals: 700.
	
]

{ #category : 'tests' }
IceMetacelloIntegrationUpdateALoadedVersionTest >> testUpdateProjectShouldCheckoutTheNewVersion [

	Metacello new
		baseline: 'PharoGitTest';
		repository:'github://pharo-vcs/test-project-source-properties-tonel';
		load.

	self assert: self repositoryForTest head description equals: 'master'.
	self assert: (Smalltalk classNamed: #Test) new versionNumber equals: 700.

	Metacello new
		baseline: 'PharoGitTest';
		repository:'github://pharo-vcs/test-project-source-properties-tonel:1.2.3';
		onConflictUseIncoming;
		load.
		
	self assert: self repositoryForTest head description equals: '1.2.3'.
	self assert: (Smalltalk classNamed: #Test) new versionNumber equals: 697.

]
