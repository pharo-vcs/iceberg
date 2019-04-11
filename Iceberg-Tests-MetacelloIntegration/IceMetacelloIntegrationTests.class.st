Class {
	#name : #IceMetacelloIntegrationTests,
	#superclass : #AbstractIceMetacelloIntegrationTests,
	#classVars : [
		'CommitishToUse'
	],
	#category : 'Iceberg-Tests-MetacelloIntegration'
}

{ #category : #testing }
IceMetacelloIntegrationTests class >> commitishConfiguration [

	^ IceTestParameter 
		withOptions: self commitishOptions
		on: self 
		selector: #commitishToUse


]

{ #category : #testing }
IceMetacelloIntegrationTests class >> commitishOptions [

	^	{	''. "Without commitish"
			':forBecomeWriteable'. "With branch"
			':1.2.3'. "with tag"}


]

{ #category : #testing }
IceMetacelloIntegrationTests class >> commitishToUse [

	^ CommitishToUse ifNil: [ '' ]
]

{ #category : #testing }
IceMetacelloIntegrationTests class >> commitishToUse: aValue [

	CommitishToUse := aValue
]

{ #category : #testing }
IceMetacelloIntegrationTests class >> isAbstract [
	^ self name = #IceMetacelloIntegrationTests
]

{ #category : #testing }
IceMetacelloIntegrationTests class >> parameters [

	^ { self remoteTypeConfiguration. 
		 self commitishConfiguration }
]

{ #category : #creation }
IceMetacelloIntegrationTests >> createConflictingRepository [
	
	self createConflictingRepositoryIn: 'temp/test'
]

{ #category : #creation }
IceMetacelloIntegrationTests >> createConflictingRepositoryIn: aLocation [
	
	conflictingRepository := (IceRepositoryCreator new
		location: aLocation asFileReference;
		createNewRepositoryNamed: 'conflicting')
			register;
			yourself.
]

{ #category : #configuring }
IceMetacelloIntegrationTests >> expectedFileFormat [
	
	^ self subclassResponsibility
]

{ #category : #configuring }
IceMetacelloIntegrationTests >> hasProject [
	
	^ self subclassResponsibility
]

{ #category : #tests }
IceMetacelloIntegrationTests >> installBaseline [

	Metacello new
		baseline: 'PharoGitTest';
		repository: (self repository , self class commitishToUse);
		load.
]

{ #category : #testing }
IceMetacelloIntegrationTests >> isTestingHTTPS [

	^ Iceberg remoteTypeSelector = #httpsUrl
]

{ #category : #testing }
IceMetacelloIntegrationTests >> isTestingSSH [

	^ Iceberg remoteTypeSelector = #scpUrl
]

{ #category : #configuring }
IceMetacelloIntegrationTests >> shouldBeDirty [
	
	^ false
]

{ #category : #tests }
IceMetacelloIntegrationTests >> testInstallBaselineWhenNoSSHIsAvailableUsesHTTPS [

	"This test is meant to run in the CI using SSH, when SSH is not available.
	Other configurations make no sense for this test"
	self isTestingSSH ifTrue: [ ^ self skip ].

	self installBaseline.
	repository := self repositoryForTest.
		
	self assert: repository origin url asUrl scheme equals: 'https'
]

{ #category : #tests }
IceMetacelloIntegrationTests >> testInstallBaselineWhenSSHIsAvailableUsesSSH [

	"This test is meant to run on SSH when SSH is running only.
	Thus, CI is avoided"
	self isTestingSSH ifFalse: [ ^ self skip ].
	self isCI ifTrue: [ ^ self skip ].

	self installBaseline.
	repository := self repositoryForTest.
		
	self assert: (repository origin url beginsWith: 'git@')
]

{ #category : #tests }
IceMetacelloIntegrationTests >> testInstallBaselineWhileMissingRepositoryIsInstalledIsPossible [

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].
	
	self createConflictingRepository.
	conflictingRepository location: nil.

	self installBaseline.
	repository := self repositoryForTest.
		
	self assert: repository workingCopy isModified equals: self shouldBeDirty
]

{ #category : #tests }
IceMetacelloIntegrationTests >> testInstallBaselineWithConflictingRepositoryInDiskThrowsError [

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].
	
	self installBaseline.
	repository := self repositoryForTest.
	repository unload; forget.
	
	self installBaseline
]

{ #category : #tests }
IceMetacelloIntegrationTests >> testInstallBaselineWithConflictingUnrelatedRepositoryInDiskThrowsError [

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].
	
	self createConflictingRepositoryIn: IceLibgitRepository localRepositoriesLocation/ 'pharo-vcs' / self repositoryName.

	self should: [ self installBaseline ] raise: IceMetacelloDuplicatedNotification
]

{ #category : #tests }
IceMetacelloIntegrationTests >> testInstallingAMetacelloBaselineCreatesAnIcebergRepository [

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].

	self installBaseline
]

{ #category : #tests }
IceMetacelloIntegrationTests >> testNewRepositoryPackagesAreClean [

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].

	self installBaseline.
	repository := self repositoryForTest.
		
	self assert: repository workingCopy isModified equals: self shouldBeDirty
]

{ #category : #tests }
IceMetacelloIntegrationTests >> testProjectDirtiness [

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].
	
	self installBaseline.
	repository := self repositoryForTest.
	
	self assert: repository isModified equals: self shouldBeDirty
]

{ #category : #tests }
IceMetacelloIntegrationTests >> testProjectFileFormat [

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].
	
	self installBaseline.
	repository := self repositoryForTest.

	self assert: repository properties fileFormat equals: self expectedFileFormat.
]

{ #category : #tests }
IceMetacelloIntegrationTests >> testProjectHasDescriptor [

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].
	
	self installBaseline.
	repository := self repositoryForTest.

	self assert: repository project isUnborn equals: self hasProject not.
]
