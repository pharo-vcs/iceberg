"
Everytime an user tries to use an experimental feature, maybe the UI want to show a confirmation message. 

This is useful to guarantee the correct keeping of the changes.
"
Class {
	#name : #IceExperimentalFeature,
	#superclass : #IceWarning,
	#category : #'Iceberg-TipUI-Exceptions'
}

{ #category : #visiting }
IceExperimentalFeature >> acceptError: aVisitor [

	aVisitor visitExperimentalFeature: self
]
