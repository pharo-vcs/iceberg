"
I am the common class of all the commands over an specific credential.
"
Class {
	#name : #IceTipAbstractCredentialCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #accessing }
IceTipAbstractCredentialCommand >> credential [

	^ self item
]

{ #category : #accessing }
IceTipAbstractCredentialCommand >> store [

	^ self context model
]
