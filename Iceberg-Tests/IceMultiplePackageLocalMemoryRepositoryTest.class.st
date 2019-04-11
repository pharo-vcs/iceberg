Class {
	#name : #IceMultiplePackageLocalMemoryRepositoryTest,
	#superclass : #IceMultiplePackageRepositoryTest,
	#category : 'Iceberg-Tests-Memory'
}

{ #category : #running }
IceMultiplePackageLocalMemoryRepositoryTest >> newFixture [
	^ IceMultiplePackageFixture inMemory
]
