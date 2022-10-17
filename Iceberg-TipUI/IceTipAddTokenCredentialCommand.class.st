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

	((IceTipAddTokenCredentialsModel newApplication: context application)
		credentialStore: self store;
		tool: self tool;
		asDialogWindow)
			centeredRelativeTo: context window;
			open
]
