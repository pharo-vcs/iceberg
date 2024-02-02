Class {
	#name : 'IceMetacelloIntegrationTest',
	#superclass : 'AbstractIceMetacelloIntegrationTest',
	#classVars : [
		'CommitishToUse'
	],
	#category : 'Iceberg-Tests-MetacelloIntegration',
	#package : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : 'testing' }
IceMetacelloIntegrationTest class >> commitishConfiguration [

	^ IceTestParameter 
		withOptions: self commitishOptions
		on: self 
		selector: #commitishToUse


]

{ #category : 'testing' }
IceMetacelloIntegrationTest class >> commitishOptions [

	^	{	''. "Without commitish"
			':forBecomeWriteable'. "With branch"
			':1.2.3'. "with tag"}


]

{ #category : 'testing' }
IceMetacelloIntegrationTest class >> commitishToUse [

	^ CommitishToUse ifNil: [ '' ]
]

{ #category : 'testing' }
IceMetacelloIntegrationTest class >> commitishToUse: aValue [

	CommitishToUse := aValue
]

{ #category : 'testing' }
IceMetacelloIntegrationTest class >> isAbstract [
	^ self name = #IceMetacelloIntegrationTest
]

{ #category : 'testing' }
IceMetacelloIntegrationTest class >> parameters [

	^ { self remoteTypeConfiguration. 
		 self commitishConfiguration }
]

{ #category : 'creation' }
IceMetacelloIntegrationTest >> createConflictingRepository [
	
	self createConflictingRepositoryIn: 'temp/test'
]

{ #category : 'creation' }
IceMetacelloIntegrationTest >> createConflictingRepositoryIn: aLocation [
	
	conflictingRepository := (IceRepositoryCreator new
		location: aLocation asFileReference;
		createNewRepositoryNamed: 'conflicting')
			register;
			yourself.
]

{ #category : 'configuring' }
IceMetacelloIntegrationTest >> expectedFileFormat [
	
	^ self subclassResponsibility
]

{ #category : 'configuring' }
IceMetacelloIntegrationTest >> hasProject [
	
	^ self subclassResponsibility
]

{ #category : 'tests' }
IceMetacelloIntegrationTest >> installBaseline [

	Metacello new
		baseline: 'PharoGitTest';
		repository: (self repository , self class commitishToUse);
		load.
]

{ #category : 'testing' }
IceMetacelloIntegrationTest >> isTestingHTTPS [

	^ Iceberg remoteTypeSelector = #httpsUrl
]

{ #category : 'testing' }
IceMetacelloIntegrationTest >> isTestingSSH [

	^ Iceberg remoteTypeSelector = #scpUrl
]

{ #category : 'configuring' }
IceMetacelloIntegrationTest >> shouldBeDirty [
	
	^ false
]

{ #category : 'tests' }
IceMetacelloIntegrationTest >> testInstallBaselineWhenNoSSHIsAvailableUsesHTTPS [

	"This test is meant to run in the CI using SSH, when SSH is not available.
	Other configurations make no sense for this test"
	self isTestingSSH ifTrue: [ ^ self skip ].

	self installBaseline.
	repository := self repositoryForTest.
		
	self assert: repository origin url asUrl scheme equals: 'https'
]

{ #category : 'tests' }
IceMetacelloIntegrationTest >> testInstallBaselineWhenSSHIsAvailableUsesSSH [

	"This test is meant to run on SSH when SSH is running only.
	Thus, CI is avoided"
	self isTestingSSH ifFalse: [ ^ self skip ].
	self isCI ifTrue: [ ^ self skip ].

	self installBaseline.
	repository := self repositoryForTest.
		
	self assert: (repository origin url beginsWith: 'git@')
]

{ #category : 'tests' }
IceMetacelloIntegrationTest >> testInstallBaselineWhileMissingRepositoryIsInstalledIsPossible [

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].
	
	self createConflictingRepository.
	conflictingRepository location: nil.

	self installBaseline.
	repository := self repositoryForTest.
		
	self assert: repository workingCopy isModified equals: self shouldBeDirty
]

{ #category : 'tests' }
IceMetacelloIntegrationTest >> testInstallBaselineWithConflictingRepositoryInDiskThrowsError [

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].
	
	self installBaseline.
	repository := self repositoryForTest.
	repository unload; forget.
	
	self installBaseline
]

{ #category : 'tests' }
IceMetacelloIntegrationTest >> testInstallBaselineWithConflictingUnrelatedRepositoryInDiskThrowsError [

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].
	
	self createConflictingRepositoryIn: IceLibgitRepository localRepositoriesLocation/ 'pharo-vcs' / self repositoryName.

	self should: [ self installBaseline ] raise: IceMetacelloDuplicatedNotification
]

{ #category : 'tests' }
IceMetacelloIntegrationTest >> testInstallingAMetacelloBaselineCreatesAnIcebergRepository [

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].

	self installBaseline
]

{ #category : 'tests' }
IceMetacelloIntegrationTest >> testNewRepositoryPackagesAreClean [

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].

	self installBaseline.
	repository := self repositoryForTest.
		
	self assert: repository workingCopy isModified equals: self shouldBeDirty
]

{ #category : 'tests' }
IceMetacelloIntegrationTest >> testProjectDirtiness [

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].
	
	self installBaseline.
	repository := self repositoryForTest.
	
	self assert: repository isModified equals: self shouldBeDirty
]

{ #category : 'tests' }
IceMetacelloIntegrationTest >> testProjectFileFormat [

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].
	
	self installBaseline.
	repository := self repositoryForTest.

	self assert: repository properties fileFormat equals: self expectedFileFormat.
]

{ #category : 'tests' }
IceMetacelloIntegrationTest >> testProjectHasDescriptor [

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].
	
	self installBaseline.
	repository := self repositoryForTest.

	self assert: repository project isUnborn equals: self hasProject not.
]
