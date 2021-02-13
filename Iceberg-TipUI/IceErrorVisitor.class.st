"
I'm a generic error visitor to traverse diferent iceberg errors.
"
Class {
	#name : #IceErrorVisitor,
	#superclass : #Object,
	#category : #'Iceberg-TipUI-View'
}

{ #category : #'*Iceberg-TipUI' }
IceErrorVisitor >> visitNoCommitMessage: aWarning [
	self visitGenericError: aWarning
]
