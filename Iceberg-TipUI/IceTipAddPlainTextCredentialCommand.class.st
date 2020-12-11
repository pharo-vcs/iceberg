"
I create a new plaintext credential on the credential store.
"
Class {
	#name : #IceTipAddPlainTextCredentialCommand,
	#superclass : #IceTipAbstractCredentialStoreCommand,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #accessing }
IceTipAddPlainTextCredentialCommand class >> defaultDescription [
	^ 'Add a new plain text credential'
]

{ #category : #accessing }
IceTipAddPlainTextCredentialCommand class >> defaultName [
	^ 'Plain Text'
]

{ #category : #execution }
IceTipAddPlainTextCredentialCommand >> execute [

	IceTipAddPlaintextCredentialsModel new
		credentialStore: self store;
		tool: self tool;
		openNonModal
]
