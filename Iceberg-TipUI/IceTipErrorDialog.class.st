"
I'm an error dialog that is used to show generic errors to users.
This is to enhance the user experience of using iceberg, since exceptions can be sometimes intrusive or aggresive.

My model is an exception that I'll freeze for further debugging.

(IceTipErrorDialog on: anError) openDialogWithSpec
"
Class {
	#name : #IceTipErrorDialog,
	#superclass : #IceTipDialog,
	#instVars : [
		'exception',
		'errorLabel',
		'iconPanel'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipErrorDialog class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		  add: #iconPanel width: 40 * self currentWorld displayScaleFactor;
		  add: #errorLabel;
		  yourself
]

{ #category : #initialization }
IceTipErrorDialog >> accept [
	
	self closeWindow.
	exception debug.
]

{ #category : #'accessing ui' }
IceTipErrorDialog >> errorLabel [

	^ errorLabel
]

{ #category : #accessing }
IceTipErrorDialog >> exception [

	^ exception
]

{ #category : #accessing }
IceTipErrorDialog >> exception: anException [

	exception := anException freeze
]

{ #category : #'accessing ui' }
IceTipErrorDialog >> iconPanel [

	^ iconPanel
]

{ #category : #initialization }
IceTipErrorDialog >> initialExtent [

	^ (500@(
		self class inputTextHeight * 2
		+ self class buttonHeight 
		+ 50 "Yes, a magic number"
		)) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipErrorDialog >> initializeDialogWindow: aWindow [

	aWindow 
		addButton: 'Debug' 
		do: [ :presenter | self accept. presenter close ].
	aWindow 
		addButton: 'Ignore' 
		do: [ :presenter | presenter close ].
]

{ #category : #initialization }
IceTipErrorDialog >> initializePresenters [

	iconPanel := self newImage.
	iconPanel image: (self iconNamed: #error).
	errorLabel := self newText.
	errorLabel text: exception messageText
]

{ #category : #initialization }
IceTipErrorDialog >> setModelBeforeInitialization: aDomainObject [

	self exception: aDomainObject
]

{ #category : #specs }
IceTipErrorDialog >> titleForWindow [
	^ 'Error'
]
