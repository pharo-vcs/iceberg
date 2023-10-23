Class {
	#name : 'IceWithRemoteAndUnknownCommitFixture',
	#superclass : 'IceWithRemoteFixture',
	#category : 'Iceberg-Tests-Common-Fixtures',
	#package : 'Iceberg-Tests',
	#tag : 'Common-Fixtures'
}

{ #category : 'running' }
IceWithRemoteAndUnknownCommitFixture >> setUp [
	super setUp.

	"Set a commit that is known in the remote repository but not in the local one"
	(self repository lookupCommit: remoteRepository headCommit id) adopt
]
