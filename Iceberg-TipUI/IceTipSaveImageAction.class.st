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
