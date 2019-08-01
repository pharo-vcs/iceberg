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
		'saveCheckbox',
		'fixesField',
		'fixesLabel'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipCommentPanel class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #pushCheckbox;
				add: #saveCheckbox;
				yourself)
			height: self inputTextHeight;
		add: #commentText;
		add:
			(SpBoxLayout newHorizontal
				add: #fixesLabel width: 40;
				add: #fixesField;
				yourself)
			height: self inputTextHeight;
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

{ #category : #accessing }
IceTipCommentPanel >> fixesField [
	^fixesField 
]

{ #category : #accessing }
IceTipCommentPanel >> fixesLabel [
	^ fixesLabel
]

{ #category : #initialization }
IceTipCommentPanel >> initialize [
	super initialize.
	messageText := '' asText
]

{ #category : #initialization }
IceTipCommentPanel >> initializeWidgets [
	| fixesHelpString |
	pushCheckbox := self newCheckBox.
	saveCheckbox := self newCheckBox.
	self repositoryModel branchModel hasUpstream
		ifTrue: [ pushCheckbox
				label: ('Push changes to {1}' format: {self repositoryRemoteName});
				state: IceTipCommitSettings pushOnCommit;
				whenChangedDo: [ :state | IceTipCommitSettings pushOnCommit: state ] ]
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

	fixesHelpString := 'Enter the number of the issue that you fixed. Github will close it when it will be commited or merged in the default branch'.
	fixesLabel := self newLabel
		label: 'Fixes #';
		help: fixesHelpString.
	fixesField := self newNumberInput
		autoAccept: true;
		help: fixesHelpString;
		placeholder: 'issue number';
		beInteger;
		yourself.

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
		add: fixesField ;
		add: commitButton;
		add: pushCheckbox;
		add: saveCheckbox
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
|stream|
	self fixesField text isAllDigits
		ifTrue: [ 	stream := ReadWriteStream with: self commentText text asString. stream cr ; nextPutAll: 'Fixes #'; nextPutAll: self fixesField number asString . ^ stream contents  ].
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
