Class {
	#name : 'IceMultiplePackageLocalMemoryRepositoryTest',
	#superclass : 'IceMultiplePackageRepositoryTest',
	#category : 'Iceberg-Tests-Memory',
	#package : 'Iceberg-Tests',
	#tag : 'Memory'
}

{ #category : 'running' }
IceMultiplePackageLocalMemoryRepositoryTest >> newFixture [
	^ IceMultiplePackageFixture inMemory
]
