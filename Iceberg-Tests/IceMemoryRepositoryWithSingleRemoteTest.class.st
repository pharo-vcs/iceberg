Class {
	#name : #IceMemoryRepositoryWithSingleRemoteTest,
	#superclass : #IceRepositoryWithSingleRemoteTest,
	#category : 'Iceberg-Tests-Memory'
}

{ #category : #running }
IceMemoryRepositoryWithSingleRemoteTest >> newFixture [
	^ IceWithRemoteFixture inMemory
]
