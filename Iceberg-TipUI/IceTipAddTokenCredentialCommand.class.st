Class {
	#name : #IceTipAddTokenCredentialCommand,
	#superclass : #IceTipAbstractCredentialStoreCommand,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #activation }
IceTipAddTokenCredentialCommand class >> browserShortcutActivation [
	<classAnnotation>
	
	^ IceTipToolbarActivation 
		byRootGroupItemFor: IceTipCredentialsStoreContext
		order: 100
]

{ #category : #accessing }
IceTipAddTokenCredentialCommand class >> defaultHelp [
	^ 'Add a new token credential'
]

{ #category : #accessing }
IceTipAddTokenCredentialCommand class >> defaultMenuIconName [
	^ #add
]

{ #category : #accessing }
IceTipAddTokenCredentialCommand class >> defaultMenuItemName [
	^ 'Token'
]

{ #category : #accessing }
IceTipAddTokenCredentialCommand class >> defaultPosition [
	^ #right
]

{ #category : #execution }
IceTipAddTokenCredentialCommand >> execute [
	IceTipAddTokenCredentialsModel new
		credentialStore: store;
		tool: tool;
		openNonModal.
]
