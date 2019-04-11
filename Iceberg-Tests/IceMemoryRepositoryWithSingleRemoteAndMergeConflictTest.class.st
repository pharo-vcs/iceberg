Class {
	#name : #IceMemoryRepositoryWithSingleRemoteAndMergeConflictTest,
	#superclass : #IceRepositoryWithSingleRemoteAndMergeConflictTest,
	#category : 'Iceberg-Tests-Memory'
}

{ #category : #running }
IceMemoryRepositoryWithSingleRemoteAndMergeConflictTest >> newFixture [
	^ IceWithRemoteAndMergeConflictFixture inMemory
]
