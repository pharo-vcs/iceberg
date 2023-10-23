Class {
	#name : 'IceUnknownCommitRepositoryTest',
	#superclass : 'IceAbstractTestCase',
	#category : 'Iceberg-Tests-Common',
	#package : 'Iceberg-Tests',
	#tag : 'Common'
}

{ #category : 'testing' }
IceUnknownCommitRepositoryTest class >> isAbstract [

	^ self == IceUnknownCommitRepositoryTest
]

{ #category : 'running' }
IceUnknownCommitRepositoryTest >> testFetchFixesUnknownCommit [

	self repository fetch.
	self deny: self repository workingCopy referenceCommit isUnknownCommit.
	self assert: self repository workingCopy workingCopyState isSingleCommitState
]

{ #category : 'running' }
IceUnknownCommitRepositoryTest >> testReferenceCommitIsUnknown [

	self assert: self repository workingCopy referenceCommit isUnknownCommit
]

{ #category : 'running' }
IceUnknownCommitRepositoryTest >> testWorkingCopyIsUnknownVersionWorkingCopy [

	self assert: self repository workingCopy workingCopyState isUnknownCommitState
]
