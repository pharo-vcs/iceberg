Class {
	#name : 'IceMissingLocalRepositoryFixture',
	#superclass : 'IceCleanWorkingCopyFixture',
	#category : 'Iceberg-Tests-Common-Fixtures',
	#package : 'Iceberg-Tests',
	#tag : 'Common-Fixtures'
}

{ #category : 'running' }
IceMissingLocalRepositoryFixture >> setUp [

	super setUp.
	repository location: nil.
]
