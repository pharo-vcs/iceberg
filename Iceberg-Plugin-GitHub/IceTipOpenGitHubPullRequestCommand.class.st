"
Description
--------------------

I am a simple command to open the PR review tool.
"
Class {
	#name : #IceTipOpenGitHubPullRequestCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #accessing }
IceTipOpenGitHubPullRequestCommand class >> defaultDescription [

	^ 'Open the Pull Request review tool'
]

{ #category : #accessing }
IceTipOpenGitHubPullRequestCommand class >> defaultName [

	^ 'Review pull request'
]

{ #category : #testing }
IceTipOpenGitHubPullRequestCommand >> canBeExecuted [

	^ self hasSelectedItem
]

{ #category : #execution }
IceTipOpenGitHubPullRequestCommand >> execute [

	self tool viewPullRequest: self item
]

{ #category : #accessing }
IceTipOpenGitHubPullRequestCommand >> iconName [

	^ #smallFind
]
