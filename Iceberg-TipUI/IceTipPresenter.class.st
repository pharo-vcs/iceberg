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

{ #category : 'extensions' }
IceTipPresenter >> updateTitle [
	
	self withWindowDo: [ :aWindow | aWindow title: self windowTitle ]
]

{ #category : 'initialization' }
IceTipPresenter >> windowIcon [
	"Answer a Form to be used during initialization when opening in a SpWindowPresenter."

	^ self iconNamed: #smallWindow
]
