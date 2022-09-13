"
I'm a dialog to add remotes to a repository.
"
Class {
	#name : #IceTipAddRemoteDialog,
	#superclass : #IceTipDialog,
	#instVars : [
		'model',
		'nameLabel',
		'urlLabel',
		'urlText',
		'nameText',
		'acceptBlock'
	],
	#category : #'Iceberg-TipUI-View-Repository'
}

{ #category : #actions }
IceTipAddRemoteDialog >> accept [

	self validate.
	(self model 
		newAddRemoteActionName: self remoteName 
		url: self remoteUrl)
		executeWithContext: self.
		
	^ acceptBlock ifNotNil: [ acceptBlock cull: self remoteName ]
]

{ #category : #layout }
IceTipAddRemoteDialog >> defaultLayout [

	^ SpGridLayout new
		borderWidth: 5;
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder | builder 
			add: nameLabel; add: nameText; nextRow;
			add: urlLabel; add: urlText; nextRow ];
		yourself
	
]

{ #category : #initialization }
IceTipAddRemoteDialog >> initialExtentForWindow [

	^ (500@(
		self class inputTextHeight * 2
		+ self class buttonHeight 
		+ 50 "Yes, a magic number"
		)) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipAddRemoteDialog >> initializePresenters [

	nameLabel := self newLabel
		label: 'Remote name';
		yourself.
	nameText := self newTextInput
		placeholder: 'e.g., user-remote';
		autoAccept: true;
		yourself.
	urlLabel := self newLabel
		label: 'Remote URL';
		yourself.
	urlText := self newTextInput
		placeholder: 'e.g., git@github.com:user/project.git';
		autoAccept: true;
		yourself
]

{ #category : #accessing }
IceTipAddRemoteDialog >> model [

	^ model
]

{ #category : #accessing }
IceTipAddRemoteDialog >> model: anObject [

	model := anObject
]

{ #category : #'accessing - ui' }
IceTipAddRemoteDialog >> nameLabel [

	^ nameLabel
]

{ #category : #'accessing - ui' }
IceTipAddRemoteDialog >> nameText [

	^ nameText
]

{ #category : #events }
IceTipAddRemoteDialog >> onAccept: aBlock [

	acceptBlock := aBlock
]

{ #category : #accessing }
IceTipAddRemoteDialog >> remoteName [

	^ self nameText text trimmed
]

{ #category : #accessing }
IceTipAddRemoteDialog >> remoteUrl [

	^ self urlText text trimmed
]

{ #category : #initialization }
IceTipAddRemoteDialog >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : #initialization }
IceTipAddRemoteDialog >> titleForWindow [

	^ 'Add remote'
]

{ #category : #'accessing - ui' }
IceTipAddRemoteDialog >> urlLabel [

	^ urlLabel
]

{ #category : #'accessing - ui' }
IceTipAddRemoteDialog >> urlText [

	^ urlText
]

{ #category : #actions }
IceTipAddRemoteDialog >> validate [

	self
		assert: self remoteName notEmpty 
		description: 'You need to specify a remote name.'.
	self
		assert: self remoteUrl notEmpty
		description: 'You need to specify a remote url.'

]
