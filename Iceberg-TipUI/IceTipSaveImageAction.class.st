"
I implement the action of saving the image.

I'm used by the presenter that prepares the commit.
"
Class {
	#name : #IceTipSaveImageAction,
	#superclass : #Object,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #execution }
IceTipSaveImageAction >> execute [

	Smalltalk saveSession.
	self inform: 'Image automatically saved'
]
