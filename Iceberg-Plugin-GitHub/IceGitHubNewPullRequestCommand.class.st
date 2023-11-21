"
I'm a command to create a Pull Request
"
Class {
	#name : 'IceGitHubNewPullRequestCommand',
	#superclass : 'IceGitHubRemoteCommand',
	#category : 'Iceberg-Plugin-GitHub-Commands',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceGitHubNewPullRequestCommand class >> defaultName [

	^ 'Create Pull Request...'
]

{ #category : 'executing' }
IceGitHubNewPullRequestCommand >> execute [

	^ IceGitHubNewPullRequestAction new
		repository: self repository;
		executeWithContext: context
]
