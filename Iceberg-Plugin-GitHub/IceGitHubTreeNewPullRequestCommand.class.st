"
I'm a command to create a Pull Request
"
Class {
	#name : 'IceGitHubTreeNewPullRequestCommand',
	#superclass : 'IceGitHubTreeCommand',
	#category : 'Iceberg-Plugin-GitHub-Commands',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceGitHubTreeNewPullRequestCommand class >> defaultName [

	^ 'New Pull Request'
]

{ #category : 'executing' }
IceGitHubTreeNewPullRequestCommand >> execute [ 

	^ IceGitHubNewPullRequestAction new
		repository: self repository;
		remote: self remote;
		executeWithContext: context

]
