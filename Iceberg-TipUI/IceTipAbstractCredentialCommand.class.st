"
I am the common class of all the commands over an specific credential.
"
Class {
	#name : 'IceTipAbstractCredentialCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'testing' }
IceTipAbstractCredentialCommand class >> isAbstract [

	^ self == IceTipAbstractCredentialCommand
]

{ #category : 'accessing' }
IceTipAbstractCredentialCommand >> credential [

	^ self item
]

{ #category : 'accessing' }
IceTipAbstractCredentialCommand >> store [

	^ self context model
]
