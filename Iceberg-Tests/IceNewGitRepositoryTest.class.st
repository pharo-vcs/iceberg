Class {
	#name : 'IceNewGitRepositoryTest',
	#superclass : 'IceNewRepositoryTest',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceNewGitRepositoryTest >> newFixture [
	^ IceBasicRepositoryFixture inGit
]
