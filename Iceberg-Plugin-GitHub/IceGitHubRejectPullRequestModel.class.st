"
I'm a dialog to collect data about a pull request rejection.
"
Class {
	#name : 'IceGitHubRejectPullRequestModel',
	#superclass : 'IceTipPresenter',
	#instVars : [
		'messageLabel',
		'messageText',
		'acceptButton',
		'acceptBlock'
	],
	#category : 'Iceberg-Plugin-GitHub-View',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'View'
}

{ #category : 'actions' }
IceGitHubRejectPullRequestModel >> accept [

	acceptBlock ifNotNil: [ acceptBlock cull: self ].

	self closeWindow
]

{ #category : 'accessing - ui' }
IceGitHubRejectPullRequestModel >> acceptButton [

	^ acceptButton
]

{ #category : 'accessing' }
IceGitHubRejectPullRequestModel >> availableTypes [

	^ #( 'merge' 'squash' 'rebase' )
]

{ #category : 'layout' }
IceGitHubRejectPullRequestModel >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		borderWidth: 5;
		spacing: 5;
		add: messageLabel expand: false;
		add: messageText;
		yourself
]

{ #category : 'accessing' }
IceGitHubRejectPullRequestModel >> defaultType [

	^ 'merge'
]

{ #category : 'api' }
IceGitHubRejectPullRequestModel >> initialExtentForWindow [

	^ (500 @ 250) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceGitHubRejectPullRequestModel >> initializeDialogWindow: aDialogWindowPresenter [

	aDialogWindowPresenter
		addButton: 'Cancel' do: [ :presenter | 
			presenter triggerCancelAction.
			presenter close ];
		addDefaultButton: 'Reject' do: [ :presenter | 
			presenter triggerOkAction.
			presenter close ]
]

{ #category : 'initialization' }
IceGitHubRejectPullRequestModel >> initializePresenters [

	super initializePresenters.
	messageLabel := self newLabel.
	messageText := self newText autoAccept: true.
	acceptButton := self newButton.

	messageLabel label: 'Comment'.
	messageText placeholder: self messageGhostText.
	acceptButton
		label: 'Reject pull request';
		action: [ self accept ].

]

{ #category : 'accessing' }
IceGitHubRejectPullRequestModel >> message [

	^ self messageText text asString
]

{ #category : 'accessing' }
IceGitHubRejectPullRequestModel >> messageGhostText [

	^ 'Commit title

Add an optional extented description'
]

{ #category : 'accessing - ui' }
IceGitHubRejectPullRequestModel >> messageLabel [

	^ messageLabel
]

{ #category : 'accessing - ui' }
IceGitHubRejectPullRequestModel >> messageText [

	^ messageText
]

{ #category : 'events' }
IceGitHubRejectPullRequestModel >> onAccept: aBlock [

	acceptBlock := aBlock
]

{ #category : 'specs' }
IceGitHubRejectPullRequestModel >> titleForWindow [

	^ 'Reject pull request'
]
