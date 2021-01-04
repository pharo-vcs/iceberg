"
Description
--------------------

I am a simple command to refresh the content of the github pull requests browser
"
Class {
	#name : #IceTipRefreshPullRequestsCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-Plugin-GitHub-Commands'
}

{ #category : #accessing }
IceTipRefreshPullRequestsCommand class >> defaultDescription [

	^ 'Refresh the pull requests availables'
]

{ #category : #accessing }
IceTipRefreshPullRequestsCommand class >> defaultName [

	^ 'Refresh'
]

{ #category : #execution }
IceTipRefreshPullRequestsCommand >> execute [

	UIManager default
		informUser: 'Refreshing pull request list'
		during: [ self tool refreshPullRequests ]
]

{ #category : #accessing }
IceTipRefreshPullRequestsCommand >> iconName [

	^ #glamorousRefresh
]

{ #category : #accessing }
IceTipRefreshPullRequestsCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
