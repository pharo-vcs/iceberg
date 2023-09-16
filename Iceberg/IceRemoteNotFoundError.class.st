Class {
	#name : 'IceRemoteNotFoundError',
	#superclass : 'IceError',
	#instVars : [
		'remoteName'
	],
	#category : 'Iceberg-Errors',
	#package : 'Iceberg',
	#tag : 'Errors'
}

{ #category : 'accessing' }
IceRemoteNotFoundError >> remoteName [
	^ remoteName
]

{ #category : 'accessing' }
IceRemoteNotFoundError >> remoteName: aString [ 
	remoteName := aString
]
