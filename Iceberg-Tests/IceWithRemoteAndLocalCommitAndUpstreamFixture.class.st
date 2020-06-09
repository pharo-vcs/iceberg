Class {
	#name : #IceWithRemoteAndLocalCommitAndUpstreamFixture,
	#superclass : #IceWithRemoteAndLocalCommitFixture,
	#category : #'Iceberg-Tests-Common-Fixtures'
}

{ #category : #running }
IceWithRemoteAndLocalCommitAndUpstreamFixture >> setUp [
	super setUp.
	repository branch setUpstream: remoteRepository branch.
]
