"
I open the edit dialog on the credential.
I colaborate with the credential to know the specific class of the dialog model.
Check #editModelClass in IceSshCredentials and IcePlaintextCredentials
"
Class {
	#name : 'IceTipEditCredentialCommand',
	#superclass : 'IceTipAbstractCredentialCommand',
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'accessing - defaults' }
IceTipEditCredentialCommand class >> defaultDescription [

	^ 'Edits the credential from the store'
]

{ #category : 'accessing - defaults' }
IceTipEditCredentialCommand class >> defaultName [

	^ 'Edit'
]

{ #category : 'executing' }
IceTipEditCredentialCommand >> execute [

	((self item editModelClass newApplication: context application)
		credentials: self item;
		credentialStore: self store;
		tool: self tool;
		asDialogWindow)
			centeredRelativeTo: context window;
			open
]

{ #category : 'accessing' }
IceTipEditCredentialCommand >> iconName [

	^ #edit
]

{ #category : 'accessing' }
IceTipEditCredentialCommand >> shortcutKey [

	^ $e meta
]
