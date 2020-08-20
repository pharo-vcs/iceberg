"
I represent the common behavior of all iceberg credentials.
"
Class {
	#name : #IceAbstractCredentials,
	#superclass : #Object,
	#instVars : [
		'host'
	],
	#category : #'Iceberg-Security'
}

{ #category : #accessing }
IceAbstractCredentials >> description [
	^ self subclassResponsibility
]

{ #category : #accessing }
IceAbstractCredentials >> host [
	^ host
]

{ #category : #accessing }
IceAbstractCredentials >> host: anObject [
	host := anObject
]

{ #category : #accessing }
IceAbstractCredentials >> hostDescription [
	^ self subclassResponsibility
]

{ #category : #testing }
IceAbstractCredentials >> isDefault [
	^ false
]

{ #category : #accessing }
IceAbstractCredentials >> isPresent [
	^ self subclassResponsibility
]

{ #category : #'API - storing' }
IceAbstractCredentials >> storeInto: aCredentialStore forHostname: aHost [ 
	host := aHost.
	aCredentialStore storePlaintextCredential: self forHostname: aHost
]

{ #category : #accessing }
IceAbstractCredentials >> type [
	^ self subclassResponsibility
]
