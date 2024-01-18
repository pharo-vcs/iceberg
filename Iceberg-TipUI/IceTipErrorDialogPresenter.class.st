"
I'm an error dialog that is used to show generic errors to users.
This is to enhance the user experience of using iceberg, since exceptions can be sometimes intrusive or aggresive.

My model is an exception that I'll freeze for further debugging.

(IceTipErrorDialog on: anError) openDialogWithSpec
"
Class {
	#name : 'IceTipErrorDialogPresenter',
	#superclass : 'IceTipDialogPresenter',
	#instVars : [
		'exception',
		'errorLabel',
		'iconPanel'
	],
	#category : 'Iceberg-TipUI-View',
	#package : 'Iceberg-TipUI',
	#tag : 'View'
}

{ #category : 'initialization' }
IceTipErrorDialogPresenter >> accept [
	
	self closeWindow.
	exception debug.
]

{ #category : 'layout' }
IceTipErrorDialogPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		borderWidth: 5;
		spacing: 10;
		add: iconPanel expand: false;
		add: errorLabel;
		yourself
]

{ #category : 'accessing - ui' }
IceTipErrorDialogPresenter >> errorLabel [

	^ errorLabel
]

{ #category : 'accessing' }
IceTipErrorDialogPresenter >> exception [

	^ exception
]

{ #category : 'accessing' }
IceTipErrorDialogPresenter >> exception: anException [

	exception := anException freeze
]

{ #category : 'accessing - ui' }
IceTipErrorDialogPresenter >> iconPanel [

	^ iconPanel
]

{ #category : 'initialization' }
IceTipErrorDialogPresenter >> initialExtentForWindow [

	^ (500@(
		self class inputTextHeight * 2
		+ self class buttonHeight 
		+ 50 "Yes, a magic number"
		)) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipErrorDialogPresenter >> initializeDialogWindow: aWindow [

	aWindow 
		addButton: 'Ignore' do: [ :presenter | presenter close ];
		addDefaultButton: 'Debug' do: [ :presenter | self accept. presenter close ]
]

{ #category : 'initialization' }
IceTipErrorDialogPresenter >> initializePresenters [

	iconPanel := self newImage.
	iconPanel image: (self iconNamed: #error).

	errorLabel := self newText.
	errorLabel text: exception messageText.
	errorLabel editable: false
]

{ #category : 'initialization' }
IceTipErrorDialogPresenter >> setModelBeforeInitialization: aDomainObject [

	self exception: aDomainObject
]

{ #category : 'initialization' }
IceTipErrorDialogPresenter >> titleForWindow [

	^ 'Error'
]
