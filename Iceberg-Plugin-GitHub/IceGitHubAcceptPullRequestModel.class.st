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

{ #category : #specs }
IceGitHubAcceptPullRequestModel class >> defaultSpec [

	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #messageLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #messageText;
				yourself);
		add:
			(SpBoxLayout newHorizontal
				add: #typeLabel
					withConstraints:
						[ :constraints | constraints width: 80 * self currentWorld displayScaleFactor ];
				add: #typeList;
				yourself)
			withConstraints: [ :constraints | constraints width: 25 * self currentWorld displayScaleFactor ];
		add: #acceptButton
			withConstraints: [ :constraints | constraints height: self buttonHeight ];
		yourself
]

{ #category : #actions }
IceGitHubAcceptPullRequestModel >> accept [

	acceptBlock ifNotNil: [ acceptBlock cull: self ].

	self closeWindow
]

{ #category : #'accessing ui' }
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
	messageText := self newText autoAccept: true.
	typeLabel := self newLabel.
	typeList := self newDropList.
	acceptButton := self newButton.
		
	messageLabel label: 'Comment'.
	messageText 	whenBuiltDo: [ :this | this widget withGhostText: self messageGhostText ].
	typeLabel label: 'Merge type'.
	acceptButton label: 'Accept pull request'.
	acceptButton action: [ self accept ].

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

{ #category : #'accessing ui' }
IceGitHubAcceptPullRequestModel >> messageLabel [

	^ messageLabel
]

{ #category : #'accessing ui' }
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

{ #category : #'accessing ui' }
IceGitHubAcceptPullRequestModel >> typeLabel [

	^ typeLabel
]

{ #category : #'accessing ui' }
IceGitHubAcceptPullRequestModel >> typeList [

	^ typeList
]
