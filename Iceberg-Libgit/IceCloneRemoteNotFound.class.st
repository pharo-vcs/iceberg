"
The remote was not found
"
Class {
	#name : 'IceCloneRemoteNotFound',
	#superclass : 'IceCloneError',
	#instVars : [
		'remoteUrl'
	],
	#category : 'Iceberg-Libgit-Exceptions',
	#package : 'Iceberg-Libgit',
	#tag : 'Exceptions'
}

{ #category : 'signalling' }
IceCloneRemoteNotFound class >> signalFor: aUrl [
	^ self new
		remoteUrl: aUrl;
		signal.
]

{ #category : 'visiting' }
IceCloneRemoteNotFound >> acceptError: aVisitor [
	aVisitor visitCloneRemoteNotFound: self.
]

{ #category : 'accessing' }
IceCloneRemoteNotFound >> remoteUrl [
	^ remoteUrl
]

{ #category : 'accessing' }
IceCloneRemoteNotFound >> remoteUrl: anObject [
	remoteUrl := anObject
]
