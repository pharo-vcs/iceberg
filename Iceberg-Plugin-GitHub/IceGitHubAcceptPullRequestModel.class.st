"
I'm a dialog for collecting data to accept a pull request.
"
Class {
	#name : 'IceGitHubAcceptPullRequestModel',
	#superclass : 'IceTipPresenter',
	#instVars : [
		'messageLabel',
		'messageText',
		'typeLabel',
		'typeList',
		'acceptBlock'
	],
	#category : 'Iceberg-Plugin-GitHub-View',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'View'
}

{ #category : 'actions' }
IceGitHubAcceptPullRequestModel >> accept [

	acceptBlock ifNotNil: [ 
		acceptBlock cull: self ].
	self closeWindow
]

{ #category : 'accessing' }
IceGitHubAcceptPullRequestModel >> availableTypes [

	^ #( 'merge' 'squash' 'rebase' )
]

{ #category : 'initialization' }
IceGitHubAcceptPullRequestModel >> connectPresenters [

	self typeList
		items: self availableTypes;
		selectItem: self defaultType
]

{ #category : 'layout' }
IceGitHubAcceptPullRequestModel >> defaultLayout [

	^ SpGridLayout new 
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder | builder
			add: messageLabel; add: messageText; nextRow;
			add: typeLabel; add: typeList; nextRow ];
		yourself
]

{ #category : 'accessing' }
IceGitHubAcceptPullRequestModel >> defaultType [

	^ 'merge'
]

{ #category : 'api' }
IceGitHubAcceptPullRequestModel >> initialExtentForWindow [

	^ (600 @ 300) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceGitHubAcceptPullRequestModel >> initializeDialogWindow: aDialogWindowPresenter [
	
	aDialogWindowPresenter
		addButton: 'Cancel' do: [ :presenter | 
			presenter triggerCancelAction.
			presenter close ];
		addDefaultButton: 'Accept' do: [ :presenter | 
			self accept ]
]

{ #category : 'initialization' }
IceGitHubAcceptPullRequestModel >> initializePresenters [

	messageLabel := self newLabel.
	messageText := self newText.
	typeLabel := self newLabel.
	typeList := self newDropList.
		
	messageLabel label: 'Comment'.
	messageText addStyle: 'lines8'.
	messageText placeholder: self messageGhostText.
	typeLabel label: 'Merge type'
]

{ #category : 'accessing' }
IceGitHubAcceptPullRequestModel >> message [

	^ self messageText text asString
]

{ #category : 'accessing' }
IceGitHubAcceptPullRequestModel >> messageGhostText [

	^ 'Commit title

Add an optional extented description'
]

{ #category : 'accessing - ui' }
IceGitHubAcceptPullRequestModel >> messageLabel [

	^ messageLabel
]

{ #category : 'accessing - ui' }
IceGitHubAcceptPullRequestModel >> messageText [

	^ messageText
]

{ #category : 'events' }
IceGitHubAcceptPullRequestModel >> onAccept: aBlock [
	acceptBlock := aBlock
]

{ #category : 'specs' }
IceGitHubAcceptPullRequestModel >> titleForWindow [

	^ 'Accept pull request'
]

{ #category : 'accessing' }
IceGitHubAcceptPullRequestModel >> type [

	^ self typeList selectedItem
]

{ #category : 'accessing - ui' }
IceGitHubAcceptPullRequestModel >> typeLabel [

	^ typeLabel
]

{ #category : 'accessing - ui' }
IceGitHubAcceptPullRequestModel >> typeList [

	^ typeList
]
