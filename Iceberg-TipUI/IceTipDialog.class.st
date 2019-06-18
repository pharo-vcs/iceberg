"
I'm a general dialog. 
I implement a default accept method that needs to be overriden my children and some utility methods to easier build a dialog.
"
Class {
	#name : #IceTipDialog,
	#superclass : #IceTipComposablePresenter,
	#instVars : [
		'acceptButton',
		'cancelButton'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #actions }
IceTipDialog >> accept [
	"override this if you want a dialog"
]

{ #category : #initialization }
IceTipDialog >> initializeDialogWindow: aDialogPresenter [
	aDialogPresenter
		addButton: 'Accept'
			do: [ :presenter | 
			self accept.
			presenter close ];
		addButton: 'Cancel'
			do: [ :presenter | 
			presenter
				triggerCancelAction;
				close ]
]

{ #category : #accessing }
IceTipDialog >> openDialogWithSpec [
	^ super openDialogWithSpec
		okAction: [ self accept ];
		yourself
]
