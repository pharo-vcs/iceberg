"
I'm a command to show the pull request review browser.
"
Class {
	#name : #IceGitHubViewPullRequestsCommand,
	#superclass : #IceGitHubRemoteCommand,
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #accessing }
IceGitHubViewPullRequestsCommand class >> defaultName [

	^ 'View Pull Request...'
]

{ #category : #execute }
IceGitHubViewPullRequestsCommand >> execute [

	^ IceGitHubViewPullRequestAction new
		  repository: self repository;
		  remote: self remote;
		  execute
]
