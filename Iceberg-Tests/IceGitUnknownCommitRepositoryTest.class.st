Class {
	#name : 'IceGitUnknownCommitRepositoryTest',
	#superclass : 'IceUnknownCommitRepositoryTest',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceGitUnknownCommitRepositoryTest >> newFixture [

	^ IceWithRemoteAndUnknownCommitFixture inGit
]
