"
I am the abstract class of all the general commands in the credentials list.
"
Class {
	#name : #IceTipAbstractCredentialStoreCommand,
	#superclass : #IceTipCommand,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #initialization }
IceTipAbstractCredentialStoreCommand >> iconName [

	^ #add
]

{ #category : #testing }
IceTipAbstractCredentialStoreCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ true
]

{ #category : #execution }
IceTipAbstractCredentialStoreCommand >> store [

	^ self context store
]
