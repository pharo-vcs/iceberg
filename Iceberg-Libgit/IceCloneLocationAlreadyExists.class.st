"
Error while cloning a project - the location on disk already exists

"
Class {
	#name : 'IceCloneLocationAlreadyExists',
	#superclass : 'IceCloneError',
	#instVars : [
		'location'
	],
	#category : 'Iceberg-Libgit-Exceptions',
	#package : 'Iceberg-Libgit',
	#tag : 'Exceptions'
}

{ #category : 'signalling' }
IceCloneLocationAlreadyExists class >> signalFor: aLocation [
	^ self new
		location: aLocation;
		signal.
]

{ #category : 'visiting' }
IceCloneLocationAlreadyExists >> acceptError: aVisitor [
	aVisitor visitCloneLocationAlreadyExists: self.
]

{ #category : 'accessing' }
IceCloneLocationAlreadyExists >> location [
	^ location
]

{ #category : 'accessing' }
IceCloneLocationAlreadyExists >> location: anObject [
	location := anObject
]
