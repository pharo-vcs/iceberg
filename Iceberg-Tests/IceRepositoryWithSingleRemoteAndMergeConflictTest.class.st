Class {
	#name : 'IceRepositoryWithSingleRemoteAndMergeConflictTest',
	#superclass : 'IceAbstractTestCase',
	#category : 'Iceberg-Tests-Common',
	#package : 'Iceberg-Tests',
	#tag : 'Common'
}

{ #category : 'testing' }
IceRepositoryWithSingleRemoteAndMergeConflictTest class >> isAbstract [

	^ self == IceRepositoryWithSingleRemoteAndMergeConflictTest
]

{ #category : 'tests' }
IceRepositoryWithSingleRemoteAndMergeConflictTest >> testRepositoryHasIncomingCommitsAfterFetch [

	self repository fetch.
	self repository branch setUpstreamRemote: self remote.
	self assert: self repository hasIncomingCommits
]

{ #category : 'tests' }
IceRepositoryWithSingleRemoteAndMergeConflictTest >> testRepositoryHasNoIncomingCommitsIfNoFetch [

	self deny: self repository hasIncomingCommits
]

{ #category : 'tests' }
IceRepositoryWithSingleRemoteAndMergeConflictTest >> testRepositoryHasNoOutgoingCommitsIfNoFetch [

	self deny: self repository hasOutgoingCommits
]

{ #category : 'tests' }
IceRepositoryWithSingleRemoteAndMergeConflictTest >> testRepositoryHasOutgoingCommitsAfterFetch [

	self repository fetch.
	self repository branch setUpstreamRemote: self remote.
	self assert: self repository hasOutgoingCommits
]
