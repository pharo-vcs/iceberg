"
Description
--------------------

I am a simple command to refresh the content of the github pull requests browser
"
Class {
	#name : 'IceTipRefreshPullRequestsCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-Plugin-GitHub-Commands',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'Commands'
}

{ #category : 'accessing' }
IceTipRefreshPullRequestsCommand class >> defaultDescription [

	^ 'Refresh the pull requests availables'
]

{ #category : 'accessing' }
IceTipRefreshPullRequestsCommand class >> defaultName [

	^ 'Refresh'
]

{ #category : 'executing' }
IceTipRefreshPullRequestsCommand >> execute [

	self application
		informUser: 'Refreshing pull request list'
		during: [ self tool refreshPullRequests ]
]

{ #category : 'accessing' }
IceTipRefreshPullRequestsCommand >> iconName [

	^ #glamorousRefresh
]

{ #category : 'accessing' }
IceTipRefreshPullRequestsCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]
