"
I create a new plaintext credential on the credential store.
"
Class {
	#name : 'IceTipAddPlainTextCredentialCommand',
	#superclass : 'IceTipAbstractCredentialStoreCommand',
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'accessing - defaults' }
IceTipAddPlainTextCredentialCommand class >> defaultDescription [
	^ 'Add a new plain text credential'
]

{ #category : 'accessing - defaults' }
IceTipAddPlainTextCredentialCommand class >> defaultName [
	^ 'Plain Text'
]

{ #category : 'executing' }
IceTipAddPlainTextCredentialCommand >> execute [

	((IceTipAddPlaintextCredentialsPresenter newApplication: context application)
		credentialStore: self store;
		tool: self tool;
		asDialogWindow)
			centeredRelativeTo: context window;
			open
]
