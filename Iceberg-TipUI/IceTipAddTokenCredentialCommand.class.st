Class {
	#name : #IceTipAddTokenCredentialCommand,
	#superclass : #IceTipAbstractCredentialStoreCommand,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #accessing }
IceTipAddTokenCredentialCommand class >> defaultDescription [

	^ 'Add a new token credential'
]

{ #category : #accessing }
IceTipAddTokenCredentialCommand class >> defaultName [
	^ 'Token'
]

{ #category : #execution }
IceTipAddTokenCredentialCommand >> execute [

	IceTipAddTokenCredentialsModel new
		credentialStore: self store;
		tool: self tool;
		openNonModal
]
