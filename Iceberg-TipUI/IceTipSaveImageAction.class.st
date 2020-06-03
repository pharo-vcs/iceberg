Class {
	#name : #IceTipSaveImageAction,
	#superclass : #Object,
	#category : #'Iceberg-TipUI-View'
}

{ #category : #execution }
IceTipSaveImageAction >> execute [

	Smalltalk saveSession.
	self inform: 'Image automatically saved'
]
