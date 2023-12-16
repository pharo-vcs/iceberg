Class {
	#name : 'IceTipRemovePackageDialogPresenter',
	#superclass : 'IceTipDialogPresenter',
	#instVars : [
		'model',
		'iconPanel',
		'confirmLabel',
		'removeFromRepositoryCheckbox',
		'unloadFromImageCheckbox'
	],
	#category : 'Iceberg-TipUI-View-WorkingCopy',
	#package : 'Iceberg-TipUI',
	#tag : 'View-WorkingCopy'
}

{ #category : 'actions' }
IceTipRemovePackageDialogPresenter >> accept [

	self removeFromRepositoryCheckbox state
		ifTrue: [ self model newRemoveAction executeWithContext: self ].
	self unloadFromImageCheckbox state
		ifTrue: [ self model newUnloadAction executeWithContext: self ].
]

{ #category : 'accessing - ui' }
IceTipRemovePackageDialogPresenter >> confirmLabel [

	^ confirmLabel
]

{ #category : 'accessing' }
IceTipRemovePackageDialogPresenter >> confirmMessage [

	^ 'Are you sure to remove package {1}?'
]

{ #category : 'layout' }
IceTipRemovePackageDialogPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		borderWidth: 5;
		spacing: 10;
		add: iconPanel expand: false;
		add: (SpBoxLayout newTopToBottom
			add: confirmLabel;
			add: unloadFromImageCheckbox expand: false;
			add: removeFromRepositoryCheckbox expand: false;
			yourself);
		yourself
		
]

{ #category : 'accessing - ui' }
IceTipRemovePackageDialogPresenter >> iconPanel [

	^ iconPanel
]

{ #category : 'initialization' }
IceTipRemovePackageDialogPresenter >> initialExtentForWindow [

	^ (500
		@ (self class inputTextHeight * 2 + self class buttonHeight + 75))
		scaledByDisplayScaleFactor	"Yes, a magic number"
]

{ #category : 'initialization' }
IceTipRemovePackageDialogPresenter >> initializePresenters [

	iconPanel := self newImage
		image: (self iconNamed: #question);
		yourself.
	confirmLabel := self newLabel 
		label: (self confirmMessage format: { self model name });
		yourself.
	unloadFromImageCheckbox := self newCheckBox
		label: 'Unload from image';
		state: true;
		yourself.
	removeFromRepositoryCheckbox := self newCheckBox
		label: 'Remove from repository';
		state: true;
		yourself
]

{ #category : 'accessing' }
IceTipRemovePackageDialogPresenter >> model [

	^ model
]

{ #category : 'accessing' }
IceTipRemovePackageDialogPresenter >> model: anObject [

	model := anObject
]

{ #category : 'accessing - ui' }
IceTipRemovePackageDialogPresenter >> removeFromRepositoryCheckbox [

	^ removeFromRepositoryCheckbox
]

{ #category : 'initialization' }
IceTipRemovePackageDialogPresenter >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : 'initialization' }
IceTipRemovePackageDialogPresenter >> titleForWindow [

	^ 'Remove Package'
]

{ #category : 'accessing' }
IceTipRemovePackageDialogPresenter >> unloadFromImageCheckbox [

	^ unloadFromImageCheckbox
]
