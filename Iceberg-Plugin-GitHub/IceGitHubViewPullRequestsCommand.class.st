"
I'm a command to show the pull request review browser.
"
Class {
	#name : #IceGitHubViewPullRequestsCommand,
	#superclass : #IceGitHubRemoteCommand,
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #'accessing - defaults' }
IceGitHubViewPullRequestsCommand class >> defaultName [

	^ 'View Pull Requests...'
]

{ #category : #execute }
IceGitHubViewPullRequestsCommand >> execute [

	^ IceGitHubViewPullRequestAction new
		  repository: self repository;
		  remote: self remote;
		  execute
]
