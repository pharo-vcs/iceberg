"
I'm a command to create a Pull Request
"
Class {
	#name : #IceGitHubNewPullRequestCommand,
	#superclass : #IceGitHubRemoteCommand,
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #activation }
IceGitHubNewPullRequestCommand class >> defaultName [

	^ 'Create Pull Request...'
]

{ #category : #execute }
IceGitHubNewPullRequestCommand >> execute [

	^ IceGitHubNewPullRequestAction new
		  repository: self repository;
		  execute
]
