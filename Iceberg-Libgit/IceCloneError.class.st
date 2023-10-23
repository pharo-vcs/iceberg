"
Error while cloning a project
"
Class {
	#name : 'IceCloneError',
	#superclass : 'IceError',
	#category : 'Iceberg-Libgit-Exceptions',
	#package : 'Iceberg-Libgit',
	#tag : 'Exceptions'
}

{ #category : 'signalling' }
IceCloneError class >> signalFor: anObject [

	^ self subclassResponsibility
]
