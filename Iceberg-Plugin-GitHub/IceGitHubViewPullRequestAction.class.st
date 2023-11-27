"
I'm an action to view the open pull Requests.
"
Class {
	#name : 'IceGitHubViewPullRequestAction',
	#superclass : 'IceGitHubAction',
	#category : 'Iceberg-Plugin-GitHub-Commands',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'Commands'
}

{ #category : 'executing' }
IceGitHubViewPullRequestAction >> basicExecute [
	credentials := IceGitHubAPI ensureCredentials.
	
	self application
		informUser: ('Retrieving pull requests from {1}' format: {self remote})
		during: [ 
			(IceTipGitHubPullRequestListBrowser onRepository: self repository)
				application: context application;
				remote: self remote;
				refreshPullRequests;
				open ]
]
