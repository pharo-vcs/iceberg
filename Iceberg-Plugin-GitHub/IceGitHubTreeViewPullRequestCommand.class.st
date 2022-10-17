"
I'm a command to show the pull request review browser.
"
Class {
	#name : #IceGitHubTreeViewPullRequestCommand,
	#superclass : #IceGitHubTreeCommand,
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #'accessing - defaults' }
IceGitHubTreeViewPullRequestCommand class >> defaultName [

	^ 'View Pull Requests'
]

{ #category : #executing }
IceGitHubTreeViewPullRequestCommand >> execute [

	^ IceGitHubViewPullRequestAction new
		  repository: self repository;
		  remote: self remote;
		  executeWithContext: context
]
