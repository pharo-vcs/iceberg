"
I'm a general warning in the context of iceberg UI.
"
Class {
	#name : 'IceWarning',
	#superclass : 'Warning',
	#category : 'Iceberg-TipUI-Exceptions',
	#package : 'Iceberg-TipUI',
	#tag : 'Exceptions'
}

{ #category : 'visiting' }
IceWarning >> acceptError: aVisitor [
	self subclassResponsibility
]
