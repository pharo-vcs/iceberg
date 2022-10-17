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

{ #category : #actions }
IceTipGitUsernameAndEmailDialog >> accept [

	self username isEmptyOrNil ifTrue: [ ^ self window alert: 'user.name is required.' ].
	self email isEmptyOrNil ifTrue: [ ^ self window alert: 'user.email is required.' ].	
	
	(model getConfigurationGlobal: self isGlobal)
		username: self username;
		email: self email.
	
	self closeWindow.
	
	acceptCallback ifNotNil: [ 
		acceptCallback value ].
]

{ #category : #layout }
IceTipGitUsernameAndEmailDialog >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		borderWidth: 5;
		spacing: 5;
		add: (SpGridLayout new 
			borderWidth: 0;
			beColumnNotHomogeneous;
			column: 2 expand: true;
			build: [ :build | build 
				add: nameLabel; add: nameInput; nextRow;
				add: emailLabel; add: emailInput; nextRow ];
			yourself);
		add: globalCheckbox expand: false;
		yourself
]

{ #category : #accessing }
IceTipGitUsernameAndEmailDialog >> email [

	^ self emailInput text trimBoth
]

{ #category : #'accessing - ui' }
IceTipGitUsernameAndEmailDialog >> emailInput [

	^ emailInput
]

{ #category : #'accessing - ui' }
IceTipGitUsernameAndEmailDialog >> emailLabel [

	^ emailLabel
]

{ #category : #'accessing - ui' }
IceTipGitUsernameAndEmailDialog >> globalCheckbox [
	^ globalCheckbox
]

{ #category : #initialization }
IceTipGitUsernameAndEmailDialog >> initialExtentForWindow [

	^ (400@200) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipGitUsernameAndEmailDialog >> initializePresenters [

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
		yourself
]

{ #category : #testing }
IceTipGitUsernameAndEmailDialog >> isGlobal [

	^ self globalCheckbox state
]

{ #category : #'accessing - ui' }
IceTipGitUsernameAndEmailDialog >> nameInput [

	^ nameInput
]

{ #category : #'accessing - ui' }
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
