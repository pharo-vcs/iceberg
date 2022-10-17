Class {
	#name : #IceTipRemoveRepositoryDialog,
	#superclass : #IceTipDialog,
	#instVars : [
		'model',
		'iconPanel',
		'confirmLabel',
		'removeFileSystemCheckbox'
	],
	#category : #'Iceberg-TipUI-View-Repository'
}

{ #category : #actions }
IceTipRemoveRepositoryDialog >> accept [

	(self removeFileSystemCheckbox state
		ifTrue: [ self model newDeleteAction  ]
		ifFalse: [ self model newForgetAction ])
		executeWithContext: self
]

{ #category : #'accessing - ui' }
IceTipRemoveRepositoryDialog >> confirmLabel [

	^ confirmLabel
]

{ #category : #accessing }
IceTipRemoveRepositoryDialog >> confirmMessage [
	^ 'Are you sure to remove your repository {1} from your image?'
]

{ #category : #layout }
IceTipRemoveRepositoryDialog >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		borderWidth: 5;
		spacing: 10;
		add: iconPanel expand: false;
		add: (SpBoxLayout newTopToBottom
			add: confirmLabel;
			add: removeFileSystemCheckbox expand: false;
			yourself);
		yourself
]

{ #category : #'accessing - ui' }
IceTipRemoveRepositoryDialog >> iconPanel [

	^ iconPanel
]

{ #category : #initialization }
IceTipRemoveRepositoryDialog >> initialExtentForWindow [

	^ (500@(
		self class inputTextHeight * 2
		+ self class buttonHeight 
		+ 50 "Yes, a magic number"
		)) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipRemoveRepositoryDialog >> initializePresenters [

	iconPanel := self newImage
		image: (self iconNamed: #question);
		yourself.
	confirmLabel := self newLabel
		label: (self confirmMessage format: {self model name});
		yourself.
	removeFileSystemCheckbox := self newCheckBox
		label: self removeMessage;
		yourself
]

{ #category : #accessing }
IceTipRemoveRepositoryDialog >> model [

	^ model
]

{ #category : #accessing }
IceTipRemoveRepositoryDialog >> model: anObject [

	model := anObject
]

{ #category : #'accessing - ui' }
IceTipRemoveRepositoryDialog >> removeFileSystemCheckbox [

	^ removeFileSystemCheckbox
]

{ #category : #accessing }
IceTipRemoveRepositoryDialog >> removeMessage [
	^ 'Also remove repository from file system'
]

{ #category : #initialization }
IceTipRemoveRepositoryDialog >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : #initialization }
IceTipRemoveRepositoryDialog >> titleForWindow [

	^ 'Remove repository'
]
