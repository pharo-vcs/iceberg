"
I am the common class of all the commands over an specific credential.
"
Class {
	#name : #IceTipAbstractCredentialCommand,
	#superclass : #IceTipCommand2,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #accessing }
IceTipAbstractCredentialCommand >> credential [

	^ self context credential
]

{ #category : #accessing }
IceTipAbstractCredentialCommand >> store [

	^ self context store
]

{ #category : #accessing }
IceTipAbstractCredentialCommand >> tool [

	^ self context tool
]
