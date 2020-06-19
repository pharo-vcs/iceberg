"
In addition to my base I have a one time token as well.
"
Class {
	#name : #IcePlaintextOtpCredentials,
	#superclass : #IcePlaintextCredentials,
	#instVars : [
		'token'
	],
	#category : 'Iceberg-Security'
}

{ #category : #'as yet unclassified' }
IcePlaintextOtpCredentials >> askForModelClass [
	^ IceTipAskForPlaintextOtpCredentialsModel 
]

{ #category : #'as yet unclassified' }
IcePlaintextOtpCredentials >> token [
	^token
]

{ #category : #'as yet unclassified' }
IcePlaintextOtpCredentials >> token: aToken [
	token := aToken
]
