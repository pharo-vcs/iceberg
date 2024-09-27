"
I'm a general warning in the context of iceberg.
"
Class {
	#name : 'IceWarning',
	#superclass : 'Warning',
	#category : 'Iceberg-Errors',
	#package : 'Iceberg',
	#tag : 'Errors'
}

{ #category : 'visiting' }
IceWarning >> acceptError: aVisitor [
	self subclassResponsibility
]
