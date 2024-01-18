"
I'm a SpPresenter that is prepared to be wrapped in a window (or a dialog). The way it is prepared is through a system of hooks (template method pattern), but also providing some convenience API.
"
Class {
	#name : 'IceTipPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'decorations'
	],
	#category : 'Iceberg-TipUI-View',
	#package : 'Iceberg-TipUI',
	#tag : 'View'
}

{ #category : 'decorating' }
IceTipPresenter class >> buildDecorations [

	^ (Pragma allNamed: #extensionDecorators in: self class) 
			flatCollect: [ :pragma | self perform: pragma methodSelector ]
]

{ #category : 'accessing' }
IceTipPresenter class >> currentApplication [ 

	^ StPresenter currentApplication
]

{ #category : 'instance creation' }
IceTipPresenter class >> new [ 

	^ self newApplication: self currentApplication
]

{ #category : 'accessing' }
IceTipPresenter >> closeWindow [
	"Close the window of this presenter"

	self window close
]

{ #category : 'private' }
IceTipPresenter >> decorations [

	^ decorations ifNil: [ decorations := self class buildDecorations ]
]

{ #category : 'initialization' }
IceTipPresenter >> iconForWindow [
	"Answer a Form to be used during initialization when opening in a SpWindowPresenter."

	^ self iconNamed: #smallWindow
]

{ #category : 'initialization' }
IceTipPresenter >> initialExtentForWindow [
	"Answer either nil or a Point representing the initial extent of this presenter.
	It is used during initialization if this presenter is opened inside a SpWindowPresenter. 
	Answer nil if there is not a suggested extent."

	^ nil
]

{ #category : 'initialization' }
IceTipPresenter >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.

	self setTitleTo: aSpWindowPresenter.
	self setWindowIconTo: aSpWindowPresenter.
	self setInitialExtentTo: aSpWindowPresenter
	

]

{ #category : 'initialization' }
IceTipPresenter >> setInitialExtentTo: aSpWindowPresenter [
	
	aSpWindowPresenter initialExtent: self initialExtentForWindow
]

{ #category : 'initialization' }
IceTipPresenter >> setTitleTo: aSpWindowPresenter [

	aSpWindowPresenter title: self titleForWindow
]

{ #category : 'initialization' }
IceTipPresenter >> setWindowIconTo: aSpWindowPresenter [
	
	aSpWindowPresenter windowIcon: self iconForWindow
]

{ #category : 'initialization' }
IceTipPresenter >> titleForWindow [
	"Answer the title to use during initialization when this presenter is being opened 
	in a SpWindowPresenter."

	^ self subclassResponsibility

]

{ #category : 'extensions' }
IceTipPresenter >> updateTitle [
	
	self withWindowDo: [ :aWindow | aWindow title: self titleForWindow ]
]
