"
I'm a spec2 dialog to collect data about a pull request rejection.
"
Class {
	#name : #IceGitHubRejectPullRequestModel2,
	#superclass : #SpPresenter,
	#instVars : [
		'messageLabel',
		'messageText',
		'acceptButton',
		'acceptBlock'
	],
	#category : #'Iceberg-Plugin-GitHub-View'
}

{ #category : #accessing }
IceGitHubRejectPullRequestModel2 class >> availableTypes [
	^ #('merge' 'squash' 'rebase')
]

{ #category : #specs }
IceGitHubRejectPullRequestModel2 class >> defaultSpec [
	<spec>
	^ SpBoxLayout newVertical 
	add: (SpBoxLayout newHorizontal 
	  add: #messageLabel withConstraints: [:constraints | constraints width: 80 currentWorld displayScaleFactor ];
	  add: #messageText;
	yourself );
	add: #acceptButton withConstraints: [ :constraints | constraints height: self buttonHeight ]

"		newColumn: [ :col | 
			col
				newRow: [ :row | 
					row
						add: #messageLabel width: 80 * World displayScaleFactor;
						add: #messageText ];
				add: #acceptButton height: self buttonHeight ];
"
		yourself
]

{ #category : #accessing }
IceGitHubRejectPullRequestModel2 class >> defaultType [
	^ 'merge'
]

{ #category : #accessing }
IceGitHubRejectPullRequestModel2 class >> messageGhostText [
	^ 'Commit title

Add an optional extented description'
]

{ #category : #specs }
IceGitHubRejectPullRequestModel2 class >> title [
	^ 'Accept pull request'
]

{ #category : #actions }
IceGitHubRejectPullRequestModel2 >> accept [
	acceptBlock ifNotNil: [ 
		acceptBlock cull: self ].
	
	self window delete
]

{ #category : #'accessing ui' }
IceGitHubRejectPullRequestModel2 >> acceptButton [
	^ acceptButton
]

{ #category : #'accessing ui' }
IceGitHubRejectPullRequestModel2 >> acceptButton: anObject [
	acceptButton := anObject
]

{ #category : #api }
IceGitHubRejectPullRequestModel2 >> initialExtent [
	^ (500@250) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceGitHubRejectPullRequestModel2 >> initializeWidgets [
	messageLabel := self newLabel.
	messageText := self newText autoAccept: true.
	acceptButton := self newButton.
		
	messageLabel label: 'Comment'.
	messageText 	whenBuiltDo: [ :this | this widget withGhostText: self class messageGhostText ].
	acceptButton label: 'Reject pull request'.
	acceptButton action: [ self accept ].
	
	self focusOrder 
		add: messageText;
		add: acceptButton
]

{ #category : #accessing }
IceGitHubRejectPullRequestModel2 >> message [
	^ self messageText text asString
]

{ #category : #'accessing ui' }
IceGitHubRejectPullRequestModel2 >> messageLabel [
	^ messageLabel
]

{ #category : #'accessing ui' }
IceGitHubRejectPullRequestModel2 >> messageLabel: anObject [
	messageLabel := anObject
]

{ #category : #'accessing ui' }
IceGitHubRejectPullRequestModel2 >> messageText [
	^ messageText
]

{ #category : #'accessing ui' }
IceGitHubRejectPullRequestModel2 >> messageText: anObject [
	messageText := anObject
]

{ #category : #events }
IceGitHubRejectPullRequestModel2 >> onAccept: aBlock [
	acceptBlock := aBlock
]
