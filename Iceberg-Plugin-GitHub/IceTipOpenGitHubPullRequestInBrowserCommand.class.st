Class {
	#name : 'IceTipOpenGitHubPullRequestInBrowserCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-Plugin-GitHub-Commands',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipOpenGitHubPullRequestInBrowserCommand class >> defaultDescription [

	^ 'Open the Pull Request in your default web browser'
]

{ #category : 'accessing - defaults' }
IceTipOpenGitHubPullRequestInBrowserCommand class >> defaultName [

	^ 'Open pull request in GitHub.com'
]

{ #category : 'testing' }
IceTipOpenGitHubPullRequestInBrowserCommand >> canBeExecuted [

	^ self hasSelectedItem
]

{ #category : 'executing' }
IceTipOpenGitHubPullRequestInBrowserCommand >> execute [

	WebBrowser openOn: self item htmlUrl
]
