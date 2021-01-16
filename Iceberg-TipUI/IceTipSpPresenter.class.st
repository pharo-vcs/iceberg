Class {
	#name : #IceTipSpPresenter,
	#superclass : #SpPresenter,
	#category : #'Iceberg-TipUI-View'
}

{ #category : #private }
IceTipSpPresenter >> closeWindow [
	"Close the window of this presenter"

	self window close
]

{ #category : #specs }
IceTipSpPresenter >> iconForWindow [

	^ self iconNamed: #smallWindow
]

{ #category : #initialization }
IceTipSpPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.

	aSpWindowPresenter
		title: self titleForWindow;
		windowIcon: self iconForWindow
]

{ #category : #specs }
IceTipSpPresenter >> titleForWindow [
	"Answer the title to use during initialization when this presenter is being opened as a window (or dialog)."

	^ self subclassResponsibility

]
