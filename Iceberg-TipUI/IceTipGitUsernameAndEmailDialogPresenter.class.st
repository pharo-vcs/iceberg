"
I'm a dialog for asking ""user.name"" and ""user.email"" .
"
Class {
	#name : 'IceTipGitUsernameAndEmailDialogPresenter',
	#superclass : 'IceTipDialogPresenter',
	#instVars : [
		'nameLabel',
		'nameInput',
		'emailLabel',
		'emailInput',
		'globalCheckbox',
		'model',
		'acceptCallback'
	],
	#category : 'Iceberg-TipUI-View',
	#package : 'Iceberg-TipUI',
	#tag : 'View'
}

{ #category : 'actions' }
IceTipGitUsernameAndEmailDialogPresenter >> accept [

	self username isEmptyOrNil ifTrue: [ ^ self window alert: 'user.name is required.' ].
	self email isEmptyOrNil ifTrue: [ ^ self window alert: 'user.email is required.' ].	
	
	(model getConfigurationGlobal: self isGlobal)
		username: self username;
		email: self email.
	
	self closeWindow.
	
	acceptCallback ifNotNil: [ 
		acceptCallback value ].
]

{ #category : 'layout' }
IceTipGitUsernameAndEmailDialogPresenter >> defaultLayout [

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

{ #category : 'accessing' }
IceTipGitUsernameAndEmailDialogPresenter >> email [

	^ self emailInput text trimBoth
]

{ #category : 'accessing - ui' }
IceTipGitUsernameAndEmailDialogPresenter >> emailInput [

	^ emailInput
]

{ #category : 'accessing - ui' }
IceTipGitUsernameAndEmailDialogPresenter >> emailLabel [

	^ emailLabel
]

{ #category : 'accessing - ui' }
IceTipGitUsernameAndEmailDialogPresenter >> globalCheckbox [
	^ globalCheckbox
]

{ #category : 'initialization' }
IceTipGitUsernameAndEmailDialogPresenter >> initialExtentForWindow [

	^ (400@200) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipGitUsernameAndEmailDialogPresenter >> initializePresenters [

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

{ #category : 'testing' }
IceTipGitUsernameAndEmailDialogPresenter >> isGlobal [

	^ self globalCheckbox state
]

{ #category : 'accessing - ui' }
IceTipGitUsernameAndEmailDialogPresenter >> nameInput [

	^ nameInput
]

{ #category : 'accessing - ui' }
IceTipGitUsernameAndEmailDialogPresenter >> nameLabel [

	^ nameLabel
]

{ #category : 'events' }
IceTipGitUsernameAndEmailDialogPresenter >> onAccept: aBlockClosure [ 
	
	acceptCallback := aBlockClosure
]

{ #category : 'events' }
IceTipGitUsernameAndEmailDialogPresenter >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : 'initialization' }
IceTipGitUsernameAndEmailDialogPresenter >> titleForWindow [

	^ 'Please provide Git missing properties'
]

{ #category : 'accessing' }
IceTipGitUsernameAndEmailDialogPresenter >> username [

	^ self nameInput text trimBoth
]
