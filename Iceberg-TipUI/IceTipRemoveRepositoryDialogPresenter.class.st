Class {
	#name : 'IceTipRemoveRepositoryDialogPresenter',
	#superclass : 'IceTipDialogPresenter',
	#instVars : [
		'model',
		'iconPanel',
		'confirmLabel',
		'removeFileSystemCheckbox'
	],
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'actions' }
IceTipRemoveRepositoryDialogPresenter >> accept [

	(self removeFileSystemCheckbox state
		ifTrue: [ self model newDeleteAction  ]
		ifFalse: [ self model newForgetAction ])
		executeWithContext: self
]

{ #category : 'accessing - ui' }
IceTipRemoveRepositoryDialogPresenter >> confirmLabel [

	^ confirmLabel
]

{ #category : 'accessing' }
IceTipRemoveRepositoryDialogPresenter >> confirmMessage [
	^ 'Are you sure to remove your repository {1} from your image?'
]

{ #category : 'layout' }
IceTipRemoveRepositoryDialogPresenter >> defaultLayout [

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

{ #category : 'accessing - ui' }
IceTipRemoveRepositoryDialogPresenter >> iconPanel [

	^ iconPanel
]

{ #category : 'initialization' }
IceTipRemoveRepositoryDialogPresenter >> initialExtentForWindow [

	^ (500@(
		self class inputTextHeight * 2
		+ self class buttonHeight 
		+ 50 "Yes, a magic number"
		)) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipRemoveRepositoryDialogPresenter >> initializePresenters [

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

{ #category : 'accessing' }
IceTipRemoveRepositoryDialogPresenter >> model [

	^ model
]

{ #category : 'accessing' }
IceTipRemoveRepositoryDialogPresenter >> model: anObject [

	model := anObject
]

{ #category : 'accessing - ui' }
IceTipRemoveRepositoryDialogPresenter >> removeFileSystemCheckbox [

	^ removeFileSystemCheckbox
]

{ #category : 'accessing' }
IceTipRemoveRepositoryDialogPresenter >> removeMessage [
	^ 'Also remove repository from file system'
]

{ #category : 'initialization' }
IceTipRemoveRepositoryDialogPresenter >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : 'initialization' }
IceTipRemoveRepositoryDialogPresenter >> titleForWindow [

	^ 'Remove repository'
]
