Class {
	#name : 'IceMetacelloCloneIntegrationTest',
	#superclass : 'TestCase',
	#instVars : [
		'repository'
	],
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'utilities' }
IceMetacelloCloneIntegrationTest >> iceRepositoryFor: aRepositoryName [

	^ IceRepository registry detect: [ :repo | repo name = aRepositoryName ]
]

{ #category : 'utilities' }
IceMetacelloCloneIntegrationTest >> installBaselineFromUrl: aMetacelloRepositoryGithubUrl [

	Metacello new
		baseline: 'PharoGitTest';
		repository: aMetacelloRepositoryGithubUrl;
		load
]

{ #category : 'utilities' }
IceMetacelloCloneIntegrationTest >> installBaselineOf: aRepositoryName [

	self installBaselineFromUrl: 'github://pharo-vcs/', aRepositoryName
]

{ #category : 'running' }
IceMetacelloCloneIntegrationTest >> tearDown [ 

	repository ifNotNil: [ 
		repository 
			unload;
			forget.
		repository location ifNotNil: [ :location | location ensureDeleteAll ] ].
	
	MetacelloProjectRegistration registry baselineRegistry
		detect: [ :registration | registration projectName = 'PharoGitTest' ]
		ifFound: [ :registration | registration unregisterProject ].
			
	super tearDown
]

{ #category : 'tests' }
IceMetacelloCloneIntegrationTest >> testCanCloneARepositoryWhenBranchNotSpecifiedAndMasterBranch [

	| repoName |
	repoName := 'test-project-source-properties-tonel'.
	self installBaselineOf: repoName.
	
	repository := self iceRepositoryFor: repoName.
	
	self assert: repository head description equals: 'master'.
	self assert: (Smalltalk classNamed: #Test) new versionNumber equals: 700.
]

{ #category : 'tests' }
IceMetacelloCloneIntegrationTest >> testCanCloneARepositoryWhenBranchNotSpecifiedAndNoMasterBranch [

	| repoName |
	repoName := 'test-project-tonel-no-master'.
	self installBaselineOf: repoName.
	
	repository := self iceRepositoryFor: repoName.
	
	self assert: repository head description equals: 'main'.
	self assert: (Smalltalk classNamed: #Test) new versionNumber equals: 1201
]
