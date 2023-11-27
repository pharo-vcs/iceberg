"
I'm an action to create a new pull request.
"
Class {
	#name : 'IceGitHubNewPullRequestAction',
	#superclass : 'IceGitHubAction',
	#category : 'Iceberg-Plugin-GitHub-Commands',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'Commands'
}

{ #category : 'private' }
IceGitHubNewPullRequestAction >> askRemote: aRepository [

	^ aRepository remotes anyOne
]

{ #category : 'executing' }
IceGitHubNewPullRequestAction >> basicExecute [

	credentials := IceGitHubAPI ensureCredentials.

	remote ifNil: [ 
		remote := self repository branch hasUpstream
			ifTrue: [ self repository branch upstream remote ]
			ifFalse: [ self askRemote: self repository ]
	].

	(self validateMakePullRequestOn: self repository) ifFalse: [ ^ #() ].

	((IceGitHubCreatePullRequestModel 
		newApplication: context application
			repository: self repository
			credentials: self credentials
			headRemote: remote)
		onAccept: [ :pullRequest | self informPullRequestDone: pullRequest ];
		asModalWindow)
			centeredRelativeTo: context window;
			open
]

{ #category : 'executing' }
IceGitHubNewPullRequestAction >> informPullRequestDone: pullRequest [
	[ 
		| pullRequestDatas url |
		
		pullRequestDatas := pullRequest send.
		url := pullRequestDatas at: 'html_url'.
		self application newInform
			title: 'Pull request created. Click to view on Github.';
			onAccept: [ WebBrowser openOn: url ];
			openModal.
	]
	on: IceGitHubError
	do: [ :e | self reportError: e ]
]

{ #category : 'private' }
IceGitHubNewPullRequestAction >> validateMakePullRequestOn: aRepository [

	| status |
	status := OrderedCollection new: 2.
	aRepository isModified ifTrue: [ status add: 'Uncommitted changes' ].
	(aRepository outgoingCommitsTo: remote) ifNotEmpty: [ :commits |
		'{1} not published' format: { commits size } ].
	status ifEmpty: [ ^ true ].

	^ self application newConfirm
		  title:
			  ('{1} has ongoing modifications.' format: { aRepository name });
		  label: ('{2} 
Do you want to continue anyway?' format: { status asCommaString });
		  openModal
]
