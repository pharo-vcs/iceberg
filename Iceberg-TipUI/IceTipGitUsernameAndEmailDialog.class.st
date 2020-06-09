"
I'm a dialog for asking ""user.name"" and ""user.email"" .
"
Class {
	#name : #IceTipGitUsernameAndEmailDialog,
	#superclass : #IceTipDialog,
	#instVars : [
		'nameLabel',
		'nameInput',
		'emailLabel',
		'emailInput',
		'globalCheckbox',
		'model',
		'acceptCallback'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipGitUsernameAndEmailDialog class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #nameLabel width: 100 * self currentWorld displayScaleFactor;
				add: #nameInput;
				yourself )
			height: self inputTextHeight;
		add:
			(SpBoxLayout newHorizontal
				add: #emailLabel width: 100 * self currentWorld displayScaleFactor;
				add: #emailInput;
								yourself )
			height: self inputTextHeight;
		add: #globalCheckbox height: self inputTextHeight;
		yourself
]

{ #category : #specs }
IceTipGitUsernameAndEmailDialog class >> title [
	^ 'Please provide Git missing properties'
]

{ #category : #actions }
IceTipGitUsernameAndEmailDialog >> accept [
	self username isEmptyOrNil ifTrue: [ ^ UIManager default alert: 'user.name is required.' ].
	self email isEmptyOrNil ifTrue: [ ^ UIManager default alert: 'user.email is required.' ].	
	
	(model getConfigurationGlobal: self isGlobal)
		username: self username;
		email: self email.
	
	self window delete.
	
	acceptCallback ifNotNil: [ 
		acceptCallback value ].
]

{ #category : #accessing }
IceTipGitUsernameAndEmailDialog >> email [
	^ self emailInput text trimBoth
]

{ #category : #'accessing ui' }
IceTipGitUsernameAndEmailDialog >> emailInput [
	^ emailInput
]

{ #category : #'accessing ui' }
IceTipGitUsernameAndEmailDialog >> emailInput: anObject [
	emailInput := anObject
]

{ #category : #'accessing ui' }
IceTipGitUsernameAndEmailDialog >> emailLabel [
	^ emailLabel
]

{ #category : #'accessing ui' }
IceTipGitUsernameAndEmailDialog >> emailLabel: anObject [
	emailLabel := anObject
]

{ #category : #'accessing ui' }
IceTipGitUsernameAndEmailDialog >> globalCheckbox [
	^ globalCheckbox
]

{ #category : #'accessing ui' }
IceTipGitUsernameAndEmailDialog >> globalCheckbox: anObject [
	globalCheckbox := anObject
]

{ #category : #api }
IceTipGitUsernameAndEmailDialog >> initialExtent [
	^ (400@(
		self class inputTextHeight * 3
		+ self class buttonHeight 
		+ 50 "Yes, a magic number"
		)) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipGitUsernameAndEmailDialog >> initializeWidgets [
	nameLabel := self newLabel label: 'user.name'.
	nameInput := self newTextInput
		placeholder: 'e.g., John Doe';
		autoAccept: true.
	emailLabel := self newLabel label: 'user.email'.
	emailInput := self newTextInput
		placeholder: 'e.g., johndoe@mail.net';
		autoAccept: true.
	globalCheckbox := self newCheckBox
		label: 'Save properties as global?';
		state: false.
	self focusOrder
		add: nameInput;
		add: emailInput;
		add: globalCheckbox
]

{ #category : #testing }
IceTipGitUsernameAndEmailDialog >> isGlobal [
	^ self globalCheckbox state
]

{ #category : #'accessing ui' }
IceTipGitUsernameAndEmailDialog >> nameInput [
	^ nameInput
]

{ #category : #'accessing ui' }
IceTipGitUsernameAndEmailDialog >> nameInput: anObject [
	nameInput := anObject
]

{ #category : #'accessing ui' }
IceTipGitUsernameAndEmailDialog >> nameLabel [
	^ nameLabel
]

{ #category : #'accessing ui' }
IceTipGitUsernameAndEmailDialog >> nameLabel: anObject [
	nameLabel := anObject
]

{ #category : #events }
IceTipGitUsernameAndEmailDialog >> onAccept: aBlockClosure [ 
	
	acceptCallback := aBlockClosure
]

{ #category : #events }
IceTipGitUsernameAndEmailDialog >> setModelBeforeInitialization: anObject [ 
	model := anObject
]

{ #category : #accessing }
IceTipGitUsernameAndEmailDialog >> username [
	^ self nameInput text trimBoth
]
