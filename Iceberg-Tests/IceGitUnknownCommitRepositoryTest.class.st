Class {
	#name : #IceGitUnknownCommitRepositoryTest,
	#superclass : #IceUnknownCommitRepositoryTest,
	#category : 'Iceberg-Tests-Git'
}

{ #category : #running }
IceGitUnknownCommitRepositoryTest >> newFixture [

	^ IceWithRemoteAndUnknownCommitFixture inGit
]
