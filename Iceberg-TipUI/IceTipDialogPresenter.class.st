"
I'm a general dialog. 
I implement a default accept method that needs to be overriden my children and some utility methods to easier build a dialog.
"
Class {
	#name : 'IceTipDialogPresenter',
	#superclass : 'IceTipPresenter',
	#category : 'Iceberg-TipUI-View',
	#package : 'Iceberg-TipUI',
	#tag : 'View'
}

{ #category : 'actions' }
IceTipDialogPresenter >> accept [
	"override this if you want a dialog"
]

{ #category : 'actions' }
IceTipDialogPresenter >> cancel [
	"override this if you want a dialog"

	self closeWindow
]

{ #category : 'initialization' }
IceTipDialogPresenter >> initializeDialogWindow: aWindow [

	super initializeDialogWindow: aWindow.

	aWindow 
		okAction: [ self accept ];
		cancelAction: [ self cancel ]; 
		bindKeyCombination: Character escape asShortcut toAction: [ self cancel ]
]
