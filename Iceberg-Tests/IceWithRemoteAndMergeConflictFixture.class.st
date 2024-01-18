Class {
	#name : 'IceWithRemoteAndMergeConflictFixture',
	#superclass : 'IceWithRemoteFixture',
	#category : 'Iceberg-Tests-Common-Fixtures',
	#package : 'Iceberg-Tests',
	#tag : 'Common-Fixtures'
}

{ #category : 'running' }
IceWithRemoteAndMergeConflictFixture >> setUp [
	super setUp.

	repository workingCopy addPackageNamed: self packageName1.
	repository commitWithMessage: 'Local commit'.
]
