"
I'm a general dialog. 
I implement a default accept method that needs to be overriden my children and some utility methods to easier build a dialog.
"
Class {
	#name : #IceTipDialog,
	#superclass : #IceTipSpPresenter,
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

{ #category : #actions }
IceTipDialog >> cancel [
	"override this if you want a dialog"

	
]

{ #category : #accessing }
IceTipDialog >> openDialogWithSpec [
	^ super openDialogWithSpec
		okAction: [  self accept ];
		cancelAction: [  self cancel ];
		yourself
]
