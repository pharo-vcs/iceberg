"
I'm a command to show the pull request review browser.
"
Class {
	#name : 'IceGitHubViewPullRequestsCommand',
	#superclass : 'IceGitHubRemoteCommand',
	#category : 'Iceberg-Plugin-GitHub-Commands',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceGitHubViewPullRequestsCommand class >> defaultName [

	^ 'View Pull Requests...'
]

{ #category : 'executing' }
IceGitHubViewPullRequestsCommand >> execute [

	^ IceGitHubViewPullRequestAction new
		  repository: self repository;
		  remote: self remote;
		  executeWithContext: context
]
