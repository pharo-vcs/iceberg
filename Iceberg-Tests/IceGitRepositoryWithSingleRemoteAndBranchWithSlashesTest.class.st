Class {
	#name : 'IceGitRepositoryWithSingleRemoteAndBranchWithSlashesTest',
	#superclass : 'IceGitRepositoryWithSingleRemoteTest',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceGitRepositoryWithSingleRemoteAndBranchWithSlashesTest >> newFixture [
	^ IceWithRemoteFixture inGit
		remoteBranchName: 'feature/master'
]
