"
I implement the action of saving the image.

I'm used by the presenter that prepares the commit.
"
Class {
	#name : 'IceTipSaveImageAction',
	#superclass : 'Object',
	#instVars : [
		'context'
	],
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing' }
IceTipSaveImageAction >> context [

	^ context
]

{ #category : 'accessing' }
IceTipSaveImageAction >> context: anObject [

	context := anObject
]

{ #category : 'execution' }
IceTipSaveImageAction >> execute [

	Smalltalk saveSession.
	self context inform: 'Image automatically saved'
]
