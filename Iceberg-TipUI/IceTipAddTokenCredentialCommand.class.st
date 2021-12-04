Class {
	#name : #IceTipAddTokenCredentialCommand,
	#superclass : #IceTipAbstractCredentialStoreCommand,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #'accessing - defaults' }
IceTipAddTokenCredentialCommand class >> defaultDescription [

	^ 'Add a new token credential'
]

{ #category : #'accessing - defaults' }
IceTipAddTokenCredentialCommand class >> defaultName [
	^ 'Token'
]

{ #category : #executing }
IceTipAddTokenCredentialCommand >> execute [

	IceTipAddTokenCredentialsModel new
		credentialStore: self store;
		tool: self tool;
		openNonModal
]
