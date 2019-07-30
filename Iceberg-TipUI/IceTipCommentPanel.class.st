"
I'm a comment panel.
I can obtain a comment text and certain ""commit specific"" options. 
"
Class {
	#name : #IceTipCommentPanel,
	#superclass : #IceTipSpPresenter,
	#instVars : [
		'repositoryModel',
		'commentText',
		'pushCheckbox',
		'commitButton',
		'messageText',
		'message',
		'actionButtonBar',
		'saveCheckbox'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipCommentPanel class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
		add: #pushCheckbox height: self inputTextHeight;
		add: #saveCheckbox height: self inputTextHeight;
		add: #commentText;
		add: #actionButtonBar height: self buttonHeight
]

{ #category : #specs }
IceTipCommentPanel class >> title [
	^ 'Comment'
]

{ #category : #accessing }
IceTipCommentPanel >> actionButtonBar [
	^actionButtonBar 
]

{ #category : #accessing }
IceTipCommentPanel >> clear [
	commentText text: ''
]

{ #category : #'accessing ui' }
IceTipCommentPanel >> commentText [
	^ commentText
]

{ #category : #'accessing ui' }
IceTipCommentPanel >> commentText: anObject [
	commentText := anObject
]

{ #category : #'accessing ui' }
IceTipCommentPanel >> commitButton [
	^ commitButton
]

{ #category : #'accessing ui' }
IceTipCommentPanel >> commitButton: anObject [
	^ commitButton := anObject
]

{ #category : #initialization }
IceTipCommentPanel >> initialize [
	super initialize.
	messageText := '' asText
]

{ #category : #initialization }
IceTipCommentPanel >> initializeWidgets [
	pushCheckbox := self newCheckBox.
	saveCheckbox := self newCheckBox.
	self repositoryModel branchModel hasUpstream
		ifTrue: [ pushCheckbox
				label: ('Push changes to {1}' format: {self repositoryRemoteName});
				state: IceTipCommitSettings pushOnCommit;
						whenChangedDo: [ :state | IceTipCommitSettings pushOnCommit: state ]
				 ]
		ifFalse: [ pushCheckbox
				label: 'Cannot push new branch automatically. Use the `Push` option';
				enabled: false ].
	saveCheckbox
		label: 'Save the image when commiting';
		state: IceTipCommitSettings saveImageOnCommit;
		whenChangedDo: [ :state | IceTipCommitSettings saveImageOnCommit: state ].
	commentText := self newText
		autoAccept: true;
		whenBuiltDo: [ :ann | ann widget withGhostText: 'A comment for your commit' ].
	actionButtonBar := self newButtonBar.
	actionButtonBar
		add:
			(commitButton := self newButton
				label: 'Commit';
				icon: (self iconNamed: #smallOk);
				help: ('Commit your changes to {1}' format: {self repositoryName});
				yourself).
	self focusOrder
		add: commentText;
		add: commitButton;
		add: pushCheckbox
]

{ #category : #testing }
IceTipCommentPanel >> isPushing [
	^ self pushCheckbox state
]

{ #category : #testing }
IceTipCommentPanel >> isSaving [
	^ self saveCheckbox state
]

{ #category : #accessing }
IceTipCommentPanel >> message [
	^ self commentText text asString
]

{ #category : #events }
IceTipCommentPanel >> onCommit: aBlock [
	commitButton action: [ 
		aBlock 
			cull: self message
			cull: self isPushing ]
]

{ #category : #'accessing ui' }
IceTipCommentPanel >> pushCheckbox [
	^ pushCheckbox
]

{ #category : #'accessing ui' }
IceTipCommentPanel >> pushCheckbox: anObject [
	pushCheckbox := anObject
]

{ #category : #accessing }
IceTipCommentPanel >> refresh [
	commitButton help: ('Commit your changes to {1}' format: { self repositoryName }).
	pushCheckbox label: ('Push changes to {1}' format: { self repositoryRemoteName })
]

{ #category : #accessing }
IceTipCommentPanel >> repositoryModel [
	^ repositoryModel
]

{ #category : #'private accessing' }
IceTipCommentPanel >> repositoryName [
	^ self repositoryModel name
]

{ #category : #'private accessing' }
IceTipCommentPanel >> repositoryRemoteName [
	^ self repositoryModel pushRemoteName
]

{ #category : #'accessing ui' }
IceTipCommentPanel >> saveCheckbox [
	^ saveCheckbox
]

{ #category : #'accessing ui' }
IceTipCommentPanel >> saveCheckbox: anObject [
	saveCheckbox := anObject
]

{ #category : #initialization }
IceTipCommentPanel >> setModelBeforeInitialization: anObject [ 
	repositoryModel := anObject
]
