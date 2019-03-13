Class {
	#name : #IceGitRepositoryWithSingleRemoteAndMergeConflictTest,
	#superclass : #IceRepositoryWithSingleRemoteAndMergeConflictTest,
	#category : 'Iceberg-Tests-Git'
}

{ #category : #running }
IceGitRepositoryWithSingleRemoteAndMergeConflictTest >> newFixture [
	^ IceWithRemoteAndMergeConflictFixture inGit
]
