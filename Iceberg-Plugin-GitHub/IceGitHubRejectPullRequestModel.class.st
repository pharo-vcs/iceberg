"
I'm a dialog to collect data about a pull request rejection.
"
Class {
	#name : #IceGitHubRejectPullRequestModel,
	#superclass : #IceTipSpPresenter,
	#instVars : [
		'messageLabel',
		'messageText',
		'acceptButton',
		'acceptBlock'
	],
	#category : #'Iceberg-Plugin-GitHub-View'
}

{ #category : #specs }
IceGitHubRejectPullRequestModel class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newHorizontal
				   add: #messageLabel withConstraints: [ :constraints | 
					   constraints width: 80 currentWorld displayScaleFactor ];
				   add: #messageText;
				   yourself);
		  add: #acceptButton
		  withConstraints:
		  [ :constraints | constraints height: self buttonHeight ] yourself
]

{ #category : #actions }
IceGitHubRejectPullRequestModel >> accept [

	acceptBlock ifNotNil: [ acceptBlock cull: self ].

	self closeWindow
]

{ #category : #'accessing ui' }
IceGitHubRejectPullRequestModel >> acceptButton [

	^ acceptButton
]

{ #category : #accessing }
IceGitHubRejectPullRequestModel >> availableTypes [

	^ #( 'merge' 'squash' 'rebase' )
]

{ #category : #accessing }
IceGitHubRejectPullRequestModel >> defaultType [

	^ 'merge'
]

{ #category : #api }
IceGitHubRejectPullRequestModel >> initialExtentForWindow [

	^ (500 @ 250) scaledByDisplayScaleFactor
]

{ #category : #initialization }
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

{ #category : #accessing }
IceGitHubRejectPullRequestModel >> message [

	^ self messageText text asString
]

{ #category : #accessing }
IceGitHubRejectPullRequestModel >> messageGhostText [

	^ 'Commit title

Add an optional extented description'
]

{ #category : #'accessing ui' }
IceGitHubRejectPullRequestModel >> messageLabel [

	^ messageLabel
]

{ #category : #'accessing ui' }
IceGitHubRejectPullRequestModel >> messageText [

	^ messageText
]

{ #category : #events }
IceGitHubRejectPullRequestModel >> onAccept: aBlock [

	acceptBlock := aBlock
]

{ #category : #specs }
IceGitHubRejectPullRequestModel >> titleForWindow [

	^ 'Accept pull request'
]
