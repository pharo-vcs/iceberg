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

	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newHorizontal
				   add: #nameLabel
				   width: 100 * self currentWorld displayScaleFactor;
				   add: #nameInput;
				   yourself)
		  height: self inputTextHeight;
		  add: (SpBoxLayout newHorizontal
				   add: #emailLabel
				   width: 100 * self currentWorld displayScaleFactor;
				   add: #emailInput;
				   yourself)
		  height: self inputTextHeight;
		  add: #globalCheckbox height: self inputTextHeight;
		  yourself
]

{ #category : #actions }
IceTipGitUsernameAndEmailDialog >> accept [

	self username isEmptyOrNil ifTrue: [ ^ UIManager default alert: 'user.name is required.' ].
	self email isEmptyOrNil ifTrue: [ ^ UIManager default alert: 'user.email is required.' ].	
	
	(model getConfigurationGlobal: self isGlobal)
		username: self username;
		email: self email.
	
	self closeWindow.
	
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
IceTipGitUsernameAndEmailDialog >> emailLabel [

	^ emailLabel
]

{ #category : #'accessing ui' }
IceTipGitUsernameAndEmailDialog >> globalCheckbox [
	^ globalCheckbox
]

{ #category : #initialization }
IceTipGitUsernameAndEmailDialog >> initialExtentForWindow [

	^ (400@(
		self class inputTextHeight * 3
		+ self class buttonHeight 
		+ 50 "Yes, a magic number"
		)) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipGitUsernameAndEmailDialog >> initializePresenters [

	super initializePresenters.
	nameLabel := self newLabel
		label: 'user.name';
		yourself.
	nameInput := self newTextInput
		placeholder: 'e.g., John Doe';
		autoAccept: true;
		yourself.
	emailLabel := self newLabel
		label: 'user.email';
		yourself.
	emailInput := self newTextInput
		placeholder: 'e.g., johndoe@mail.net';
		autoAccept: true;
		yourself.
	globalCheckbox := self newCheckBox
		label: 'Save properties as global?';
		state: false;
		yourself.

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
IceTipGitUsernameAndEmailDialog >> nameLabel [

	^ nameLabel
]

{ #category : #events }
IceTipGitUsernameAndEmailDialog >> onAccept: aBlockClosure [ 
	
	acceptCallback := aBlockClosure
]

{ #category : #events }
IceTipGitUsernameAndEmailDialog >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : #initialization }
IceTipGitUsernameAndEmailDialog >> titleForWindow [

	^ 'Please provide Git missing properties'
]

{ #category : #accessing }
IceTipGitUsernameAndEmailDialog >> username [

	^ self nameInput text trimBoth
]
