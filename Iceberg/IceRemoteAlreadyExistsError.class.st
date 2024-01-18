Class {
	#name : 'IceRemoteAlreadyExistsError',
	#superclass : 'IceError',
	#instVars : [
		'remoteName'
	],
	#category : 'Iceberg-Errors',
	#package : 'Iceberg',
	#tag : 'Errors'
}

{ #category : 'visiting' }
IceRemoteAlreadyExistsError >> acceptError: aVisitor [
	aVisitor visitRemoteAlreadyExistError: self
]

{ #category : 'accessing' }
IceRemoteAlreadyExistsError >> remoteName [
	^ remoteName
]

{ #category : 'accessing' }
IceRemoteAlreadyExistsError >> remoteName: aString [ 
	remoteName := aString
]
