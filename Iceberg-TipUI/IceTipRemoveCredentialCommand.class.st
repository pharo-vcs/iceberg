"
I remove a credential from the credential store.
"
Class {
	#name : 'IceTipRemoveCredentialCommand',
	#superclass : 'IceTipAbstractCredentialCommand',
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'accessing - defaults' }
IceTipRemoveCredentialCommand class >> defaultDescription [

	^ 'Removes the credential from the store'
]

{ #category : 'accessing - defaults' }
IceTipRemoveCredentialCommand class >> defaultName [

	^ 'Remove'
]

{ #category : 'testing' }
IceTipRemoveCredentialCommand >> canBeExecuted [

	^ self item isDefault not
]

{ #category : 'executing' }
IceTipRemoveCredentialCommand >> execute [
	
	self store removeCredential: self item.
	self tool refresh.
]

{ #category : 'accessing' }
IceTipRemoveCredentialCommand >> iconName [

	^ #remove
]

{ #category : 'accessing' }
IceTipRemoveCredentialCommand >> shortcutKey [

	^ $x meta
]
