Class {
	#name : 'AbstractIceMetacelloIntegrationTest',
	#superclass : 'IceParameterizedTestCase',
	#instVars : [
		'repository',
		'conflictingRepository'
	],
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
AbstractIceMetacelloIntegrationTest class >> isAbstract [

	^ self name = #AbstractIceMetacelloIntegrationTest
]

{ #category : 'accessing' }
AbstractIceMetacelloIntegrationTest >> defaultTimeLimit [
	^ 30 seconds
]

{ #category : 'tests' }
AbstractIceMetacelloIntegrationTest >> repositoriesForTest [

	^ IceRepository registry select: [ :e | e name = self repositoryName ]
]

{ #category : 'configuring' }
AbstractIceMetacelloIntegrationTest >> repository [
	
	^ 'github://pharo-vcs/' , self repositoryName
]

{ #category : 'tests' }
AbstractIceMetacelloIntegrationTest >> repositoryForTest [

	^ IceRepository registry detect: [ :e | e name = self repositoryName ]
]

{ #category : 'configuring' }
AbstractIceMetacelloIntegrationTest >> repositoryName [
	
	^ self subclassResponsibility
]

{ #category : 'running' }
AbstractIceMetacelloIntegrationTest >> tearDown [

	(self repositoriesForTest, { conflictingRepository }) do: [ :each | each ifNotNil: [ :repo |
		repo unload.
		repo forget.
		repo location ifNotNil: #ensureDeleteAll ] ].

	"Cleanup Metacello registry to avoid conflicts"		
	MetacelloProjectRegistration registry baselineRegistry
		detect: [ :registration | registration projectName = 'PharoGitTest' ]
		ifFound: [ :registration | registration unregisterProject ].

	"Remove temporary repository just in case"
	'temp/test' asFileReference ensureDeleteAll.
	(IceLibgitRepository localRepositoriesLocation/'pharo-vcs'/self repositoryName) ensureDeleteAll.

	super tearDown.

	
]
