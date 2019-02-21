Class {
	#name : #IceSinglePackageLocalMemoryRepositoryTest,
	#superclass : #IceSinglePackageLocalRepositoryTest,
	#category : 'Iceberg-Tests-Memory'
}

{ #category : #running }
IceSinglePackageLocalMemoryRepositoryTest >> newFixture [
	^ IceSinglePackageFixture inMemory
]
