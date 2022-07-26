"
I add a new IceSshCredentials to the store
"
Class {
	#name : #IceTipAddSshCredentialCommand,
	#superclass : #IceTipAbstractCredentialStoreCommand,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #'accessing - defaults' }
IceTipAddSshCredentialCommand class >> defaultDescription [
	^ 'Add a SSH pair of credential'
]

{ #category : #'accessing - defaults' }
IceTipAddSshCredentialCommand class >> defaultName [
	^ 'SSH Pair'
]

{ #category : #execution }
IceTipAddSshCredentialCommand >> execute [

	(IceTipAddSSHCredentialsModel newApplication: context application)
		credentialStore: self store;
		tool: self tool;
		openNonModal
]
