"
In addition to my base I have a one time token as well.
"
Class {
	#name : #IcePlaintextOtpCredentials,
	#superclass : #IcePlaintextCredentials,
	#instVars : [
		'token'
	],
	#category : #'Iceberg-Security'
}

{ #category : #accessing }
IcePlaintextOtpCredentials >> token [
	^token
]

{ #category : #accessing }
IcePlaintextOtpCredentials >> token: aToken [
	token := aToken
]
