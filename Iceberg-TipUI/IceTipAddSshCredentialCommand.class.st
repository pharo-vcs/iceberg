"
I add a new IceSshCredentials to the store
"
Class {
	#name : #IceTipAddSshCredentialCommand,
	#superclass : #IceTipAbstractCredentialStoreCommand,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #accessing }
IceTipAddSshCredentialCommand class >> defaultDescription [
	^ 'Add a SSH pair of credential'
]

{ #category : #accessing }
IceTipAddSshCredentialCommand class >> defaultName [
	^ 'SSH Pair'
]

{ #category : #execution }
IceTipAddSshCredentialCommand >> execute [

	IceTipAddSSHCredentialsModel new
		credentialStore: self store;
		tool: self tool;
		openNonModal
]
