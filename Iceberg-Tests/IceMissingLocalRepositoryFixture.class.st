Class {
	#name : #IceMissingLocalRepositoryFixture,
	#superclass : #IceCleanWorkingCopyFixture,
	#category : 'Iceberg-Tests-Common-Fixtures'
}

{ #category : #running }
IceMissingLocalRepositoryFixture >> setUp [

	super setUp.
	repository location: nil.
]
