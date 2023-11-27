"
I'm a dialog to add remotes to a repository.
"
Class {
	#name : 'IceTipAddRemoteDialogPresenter',
	#superclass : 'IceTipDialogPresenter',
	#instVars : [
		'model',
		'nameLabel',
		'urlLabel',
		'urlText',
		'nameText',
		'acceptBlock'
	],
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'actions' }
IceTipAddRemoteDialogPresenter >> accept [

	self validate.
	(self model 
		newAddRemoteActionName: self remoteName 
		url: self remoteUrl)
		executeWithContext: self.
		
	^ acceptBlock ifNotNil: [ acceptBlock cull: self remoteName ]
]

{ #category : 'layout' }
IceTipAddRemoteDialogPresenter >> defaultLayout [

	^ SpGridLayout new
		borderWidth: 5;
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder | builder 
			add: nameLabel; add: nameText; nextRow;
			add: urlLabel; add: urlText; nextRow ];
		yourself
	
]

{ #category : 'initialization' }
IceTipAddRemoteDialogPresenter >> initialExtentForWindow [

	^ (500@(
		self class inputTextHeight * 2
		+ self class buttonHeight 
		+ 50 "Yes, a magic number"
		)) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipAddRemoteDialogPresenter >> initializePresenters [

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

{ #category : 'accessing' }
IceTipAddRemoteDialogPresenter >> model [

	^ model
]

{ #category : 'accessing' }
IceTipAddRemoteDialogPresenter >> model: anObject [

	model := anObject
]

{ #category : 'accessing - ui' }
IceTipAddRemoteDialogPresenter >> nameLabel [

	^ nameLabel
]

{ #category : 'accessing - ui' }
IceTipAddRemoteDialogPresenter >> nameText [

	^ nameText
]

{ #category : 'events' }
IceTipAddRemoteDialogPresenter >> onAccept: aBlock [

	acceptBlock := aBlock
]

{ #category : 'accessing' }
IceTipAddRemoteDialogPresenter >> remoteName [

	^ self nameText text trimmed
]

{ #category : 'accessing' }
IceTipAddRemoteDialogPresenter >> remoteUrl [

	^ self urlText text trimmed
]

{ #category : 'initialization' }
IceTipAddRemoteDialogPresenter >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : 'initialization' }
IceTipAddRemoteDialogPresenter >> titleForWindow [

	^ 'Add remote'
]

{ #category : 'accessing - ui' }
IceTipAddRemoteDialogPresenter >> urlLabel [

	^ urlLabel
]

{ #category : 'accessing - ui' }
IceTipAddRemoteDialogPresenter >> urlText [

	^ urlText
]

{ #category : 'actions' }
IceTipAddRemoteDialogPresenter >> validate [

	self
		assert: self remoteName isNotEmpty 
		description: 'You need to specify a remote name.'.
	self
		assert: self remoteUrl isNotEmpty
		description: 'You need to specify a remote url.'

]
