"
In addition to my base I have a one time token as well.
"
Class {
	#name : 'IcePlaintextCredentials',
	#superclass : 'IceAbstractCredentials',
	#instVars : [
		'username',
		'password'
	],
	#category : 'Iceberg-Security',
	#package : 'Iceberg',
	#tag : 'Security'
}

{ #category : 'printing' }
IcePlaintextCredentials >> description [
	^ 'User: ' , username
]

{ #category : 'printing' }
IcePlaintextCredentials >> hostDescription [
	^ host
]

{ #category : 'testing' }
IcePlaintextCredentials >> isPresent [
	^ self username isEmpty not and: [ self password isEmpty not ]
]

{ #category : 'accessing' }
IcePlaintextCredentials >> password [
	^ password ifNil: [ password := '' ]
]

{ #category : 'accessing' }
IcePlaintextCredentials >> password: anObject [
	password := anObject
]

{ #category : 'instance creation' }
IcePlaintextCredentials >> readFrom: credentials [
	self username: credentials username.
	self password: credentials password
]

{ #category : 'API - storing' }
IcePlaintextCredentials >> removeFrom: aStore [ 
	
	aStore removePlainTextCredential: self
]

{ #category : 'accessing' }
IcePlaintextCredentials >> type [
	^ 'Plain Text'
]

{ #category : 'accessing' }
IcePlaintextCredentials >> username [
	^ username ifNil: [ username := '' ]
]

{ #category : 'accessing' }
IcePlaintextCredentials >> username: anObject [
	username := anObject
]
