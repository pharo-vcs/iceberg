"
I open the edit dialog on the credential.
I colaborate with the credential to know the specific class of the dialog model.
Check #editModelClass in IceSshCredentials and IcePlaintextCredentials
"
Class {
	#name : #IceTipEditCredentialCommand,
	#superclass : #IceTipAbstractCredentialCommand,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #accessing }
IceTipEditCredentialCommand class >> defaultDescription [

	^ 'Edits the credential from the store'
]

{ #category : #accessing }
IceTipEditCredentialCommand class >> defaultName [

	^ 'Edit'
]

{ #category : #execution }
IceTipEditCredentialCommand >> execute [

	self item editModelClass new
		credentials: self item;
		credentialStore: self store;
		tool: self tool;
		openNonModal.
]

{ #category : #accessing }
IceTipEditCredentialCommand >> iconName [

	^ #edit
]

{ #category : #accessing }
IceTipEditCredentialCommand >> shortcutKey [

	^ $e meta
]
