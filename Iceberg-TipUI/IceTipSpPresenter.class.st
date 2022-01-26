"
I'm a SpPresenter that is prepared to be wrapped in a window (or a dialog). The way it is prepared is through a system of hooks (template method pattern), but also providing some convenience API.
"
Class {
	#name : #IceTipSpPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'decorations'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #'as yet unclassified' }
IceTipSpPresenter class >> buildDecorations [

	^ (Pragma allNamed: #extensionDecorators in: self class) 
			flatCollect: [ :pragma | self perform: pragma methodSelector ]
]

{ #category : #accessing }
IceTipSpPresenter class >> currentApplication [ 

	^ StPresenter currentApplication 
]

{ #category : #accessing }
IceTipSpPresenter >> closeWindow [
	"Close the window of this presenter"

	self window close
]

{ #category : #private }
IceTipSpPresenter >> decorations [

	^ decorations ifNil: [ decorations := self class buildDecorations ]
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

{ #category : #extensions }
IceTipSpPresenter >> updateTitle [
	
	self withWindowDo: [ :aWindow | aWindow title: self titleForWindow ]
]
