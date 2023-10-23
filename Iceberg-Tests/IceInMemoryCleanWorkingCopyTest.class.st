Class {
	#name : 'IceInMemoryCleanWorkingCopyTest',
	#superclass : 'IceCleanWorkingCopyTest',
	#category : 'Iceberg-Tests-Memory',
	#package : 'Iceberg-Tests',
	#tag : 'Memory'
}

{ #category : 'running' }
IceInMemoryCleanWorkingCopyTest >> newFixture [
	^ IceCleanWorkingCopyFixture inMemory
]
