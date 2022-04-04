"
I'm a dialog for collecting data to accept a pull request.
"
Class {
	#name : #IceGitHubAcceptPullRequestModel,
	#superclass : #IceTipSpPresenter,
	#instVars : [
		'messageLabel',
		'messageText',
		'typeLabel',
		'typeList',
		'acceptButton',
		'acceptBlock'
	],
	#category : #'Iceberg-Plugin-GitHub-View'
}

{ #category : #layout }
IceGitHubAcceptPullRequestModel class >> defaultLayout [

	^  SpBoxLayout newTopToBottom
		add: (SpGridLayout build: [ :builder |
					builder
						beColumnNotHomogeneous;
						column: 2 withConstraints: [ :c | c beExpand ];
						add: #messageLabel; add: #messageText; nextRow;
						add: #typeLabel; add: #typeList ]);
		add: #acceptButton expand: false;
		yourself
]

{ #category : #actions }
IceGitHubAcceptPullRequestModel >> accept [

	acceptBlock ifNotNil: [ acceptBlock cull: self ].

	self closeWindow
]

{ #category : #'accessing - ui' }
IceGitHubAcceptPullRequestModel >> acceptButton [

	^ acceptButton
]

{ #category : #accessing }
IceGitHubAcceptPullRequestModel >> availableTypes [

	^ #( 'merge' 'squash' 'rebase' )
]

{ #category : #initialization }
IceGitHubAcceptPullRequestModel >> connectPresenters [
	super connectPresenters.
	self typeList
		items: self availableTypes;
		display: [ :each | each ];
		selectItem: self defaultType
]

{ #category : #accessing }
IceGitHubAcceptPullRequestModel >> defaultType [

	^ 'merge'
]

{ #category : #api }
IceGitHubAcceptPullRequestModel >> initialExtentForWindow [

	^ (500 @ 250) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceGitHubAcceptPullRequestModel >> initializePresenters [

	super initializePresenters.
	messageLabel := self newLabel.
	messageText := self newText.
	typeLabel := self newLabel.
	typeList := self newDropList.
	acceptButton := self newButton.
		
	messageLabel label: 'Comment'.
	messageText
		autoAccept: true;
		placeholder: self messageGhostText.
	typeLabel label: 'Merge type'.
	acceptButton
		label: 'Accept pull request';
		action: [ self accept ].

]

{ #category : #accessing }
IceGitHubAcceptPullRequestModel >> message [

	^ self messageText text asString
]

{ #category : #accessing }
IceGitHubAcceptPullRequestModel >> messageGhostText [

	^ 'Commit title

Add an optional extented description'
]

{ #category : #'accessing - ui' }
IceGitHubAcceptPullRequestModel >> messageLabel [

	^ messageLabel
]

{ #category : #'accessing - ui' }
IceGitHubAcceptPullRequestModel >> messageText [

	^ messageText
]

{ #category : #events }
IceGitHubAcceptPullRequestModel >> onAccept: aBlock [
	acceptBlock := aBlock
]

{ #category : #specs }
IceGitHubAcceptPullRequestModel >> titleForWindow [

	^ 'Accept pull request'
]

{ #category : #accessing }
IceGitHubAcceptPullRequestModel >> type [

	^ self typeList selectedItem
]

{ #category : #'accessing - ui' }
IceGitHubAcceptPullRequestModel >> typeLabel [

	^ typeLabel
]

{ #category : #'accessing - ui' }
IceGitHubAcceptPullRequestModel >> typeList [

	^ typeList
]
