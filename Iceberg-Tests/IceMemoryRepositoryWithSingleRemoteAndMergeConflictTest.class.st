Class {
	#name : 'IceMemoryRepositoryWithSingleRemoteAndMergeConflictTest',
	#superclass : 'IceRepositoryWithSingleRemoteAndMergeConflictTest',
	#category : 'Iceberg-Tests-Memory',
	#package : 'Iceberg-Tests',
	#tag : 'Memory'
}

{ #category : 'running' }
IceMemoryRepositoryWithSingleRemoteAndMergeConflictTest >> newFixture [
	^ IceWithRemoteAndMergeConflictFixture inMemory
]
