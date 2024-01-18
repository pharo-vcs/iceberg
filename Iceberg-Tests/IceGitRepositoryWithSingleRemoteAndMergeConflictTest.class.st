Class {
	#name : 'IceGitRepositoryWithSingleRemoteAndMergeConflictTest',
	#superclass : 'IceRepositoryWithSingleRemoteAndMergeConflictTest',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceGitRepositoryWithSingleRemoteAndMergeConflictTest >> newFixture [
	^ IceWithRemoteAndMergeConflictFixture inGit
]
