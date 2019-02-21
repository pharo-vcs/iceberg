Class {
	#name : #IceInMemoryCleanWorkingCopyTest,
	#superclass : #IceCleanWorkingCopyTest,
	#category : 'Iceberg-Tests-Memory'
}

{ #category : #running }
IceInMemoryCleanWorkingCopyTest >> newFixture [
	^ IceCleanWorkingCopyFixture inMemory
]
