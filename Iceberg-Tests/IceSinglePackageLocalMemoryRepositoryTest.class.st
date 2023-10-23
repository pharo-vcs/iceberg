Class {
	#name : 'IceSinglePackageLocalMemoryRepositoryTest',
	#superclass : 'IceSinglePackageLocalRepositoryTest',
	#category : 'Iceberg-Tests-Memory',
	#package : 'Iceberg-Tests',
	#tag : 'Memory'
}

{ #category : 'running' }
IceSinglePackageLocalMemoryRepositoryTest >> newFixture [
	^ IceSinglePackageFixture inMemory
]
