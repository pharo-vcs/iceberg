Class {
	#name : #IceTipSpPresenter,
	#superclass : #SpPresenter,
	#category : #'Iceberg-TipUI-View'
}

{ #category : #accessing }
IceTipSpPresenter >> closeWindow [
	"Close the window of this presenter"

	self window close
]

{ #category : #initialization }
IceTipSpPresenter >> iconForWindow [
	"Answer a Form to be used during initialization when opening in a SpWindowPresenter."

	^ self iconNamed: #smallWindow
]

{ #category : #initialization }
IceTipSpPresenter >> initialExtentForWindow [
	"Answer either nil or a Point representing the initial extent of this presenter.
	It is used during initialization if this presenter is opened inside a SpWindowPresenter. 
	Answer nil if there is not a suggested extent."

	^ nil
]

{ #category : #initialization }
IceTipSpPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.

	aSpWindowPresenter
		title: self titleForWindow;
		windowIcon: self iconForWindow;
		initialExtent: self initialExtentForWindow

]

{ #category : #initialization }
IceTipSpPresenter >> titleForWindow [
	"Answer the title to use during initialization when this presenter is being opened 
	in a SpWindowPresenter."

	^ self subclassResponsibility

]
