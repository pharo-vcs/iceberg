Class {
	#name : 'IceMemoryRepositoryWithSingleRemoteTest',
	#superclass : 'IceRepositoryWithSingleRemoteTest',
	#category : 'Iceberg-Tests-Memory',
	#package : 'Iceberg-Tests',
	#tag : 'Memory'
}

{ #category : 'running' }
IceMemoryRepositoryWithSingleRemoteTest >> newFixture [
	^ IceWithRemoteFixture inMemory
]
