Class {
	#name : 'IceGitRepositoryWithSingleRemoteTest',
	#superclass : 'IceRepositoryWithSingleRemoteTest',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceGitRepositoryWithSingleRemoteTest >> newFixture [
	^ IceWithRemoteFixture inGit
		remoteBranchName: 'newBranch'
]

{ #category : 'running' }
IceGitRepositoryWithSingleRemoteTest >> testPushPushesTags [

	"We can only push if the repository is bare"
	(self remoteRepository location / '.git') moveTo: self remoteRepository location , 'git'.
	self remoteRepository location ensureDeleteAll.
	(self remoteRepository location , 'git') moveTo: self remoteRepository location.
	IceGitCommand in: self remoteRepository location execute: { 'config'. '--bool'. 'core.bare'. 'true' }.
	fixture ensureRemoteRepository.
	
	super testPushPushesTags
]
