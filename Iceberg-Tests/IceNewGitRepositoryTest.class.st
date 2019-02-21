Class {
	#name : #IceNewGitRepositoryTest,
	#superclass : #IceNewRepositoryTest,
	#category : 'Iceberg-Tests-Git'
}

{ #category : #running }
IceNewGitRepositoryTest >> newFixture [
	^ IceBasicRepositoryFixture inGit
]
