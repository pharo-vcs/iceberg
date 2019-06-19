Class {
	#name : #IceGitRepositoryWithSingleRemoteAndBranchWithSlashesTest,
	#superclass : #IceGitRepositoryWithSingleRemoteTest,
	#category : 'Iceberg-Tests-Git'
}

{ #category : #running }
IceGitRepositoryWithSingleRemoteAndBranchWithSlashesTest >> newFixture [
	^ IceWithRemoteFixture inGit
		remoteBranchName: 'feature/master'
]
