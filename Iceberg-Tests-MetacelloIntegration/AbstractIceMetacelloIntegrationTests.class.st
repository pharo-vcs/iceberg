Class {
	#name : #AbstractIceMetacelloIntegrationTests,
	#superclass : #IceParameterizedTestCase,
	#instVars : [
		'repository',
		'conflictingRepository'
	],
	#category : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : #testing }
AbstractIceMetacelloIntegrationTests class >> isAbstract [

	^ self name = #AbstractIceMetacelloIntegrationTests
]

{ #category : #accessing }
AbstractIceMetacelloIntegrationTests >> defaultTimeLimit [
	^ 30 seconds
]

{ #category : #tests }
AbstractIceMetacelloIntegrationTests >> repositoriesForTest [

	^ IceRepository registry select: [ :e | e name = self repositoryName ]
]

{ #category : #configuring }
AbstractIceMetacelloIntegrationTests >> repository [
	
	^ 'github://pharo-vcs/' , self repositoryName
]

{ #category : #tests }
AbstractIceMetacelloIntegrationTests >> repositoryForTest [

	^ IceRepository registry detect: [ :e | e name = self repositoryName ]
]

{ #category : #configuring }
AbstractIceMetacelloIntegrationTests >> repositoryName [
	
	^ self subclassResponsibility
]

{ #category : #running }
AbstractIceMetacelloIntegrationTests >> tearDown [

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
