"
I am the abstract class of all the general commands in the credentials list.
"
Class {
	#name : 'IceTipAbstractCredentialStoreCommand',
	#superclass : 'IceTipCommand',
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'testing' }
IceTipAbstractCredentialStoreCommand class >> isAbstract [

	^ self == IceTipAbstractCredentialStoreCommand
]

{ #category : 'initialization' }
IceTipAbstractCredentialStoreCommand >> iconName [

	^ #add
]

{ #category : 'testing' }
IceTipAbstractCredentialStoreCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]

{ #category : 'executing' }
IceTipAbstractCredentialStoreCommand >> store [

	^ self context store
]
