"
I'm a general warning in the context of iceberg UI.
"
Class {
	#name : #IceWarning,
	#superclass : #Warning,
	#category : #'Iceberg-TipUI-Exceptions'
}

{ #category : #visiting }
IceWarning >> acceptError: aVisitor [
	self subclassResponsibility
]
