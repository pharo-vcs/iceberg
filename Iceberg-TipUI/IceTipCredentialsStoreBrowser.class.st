"
I am the browser used to show a credentials store.
"
Class {
	#name : 'IceTipCredentialsStoreBrowser',
	#superclass : 'IceTipBrowser',
	#instVars : [
		'credentialsList'
	],
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'commands' }
IceTipCredentialsStoreBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	{	IceTipAddPlainTextCredentialCommand.
		IceTipAddSshCredentialCommand.
		IceTipAddTokenCredentialCommand }
	do: [ :each |
		aCommandGroup register: (each forSpecContext: presenter) ]
]

{ #category : 'commands' }
IceTipCredentialsStoreBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	{ 	IceTipEditCredentialCommand.
		IceTipRemoveCredentialCommand }
	do: [ :each |
		aCommandGroup register: (each forSpecContext: presenter) ]
]

{ #category : 'commands' }
IceTipCredentialsStoreBrowser class >> buildSelectionExtraCommandGroupWith: presenter for: aCommandGroup [

	aCommandGroup register: (IceTipInspectCommand forSpecContext: presenter)
]

{ #category : 'accessing' }
IceTipCredentialsStoreBrowser >> credentialsList [

	^ credentialsList
]

{ #category : 'layout' }
IceTipCredentialsStoreBrowser >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: credentialsList;
		  yourself
]

{ #category : 'initialization' }
IceTipCredentialsStoreBrowser >> initialize [

	model ifNil: [ model := IceCredentialStore current ].
	super initialize
]

{ #category : 'initialization' }
IceTipCredentialsStoreBrowser >> initializeCredentialsList [

	credentialsList
		addColumn:
			(SpStringTableColumn new
				title: 'Host';
				evaluated: #hostDescription;
				width: 100 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			((SpStringTableColumn
				title: 'Type'
				evaluated: #type)
				width: 75 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			(SpStringTableColumn
				title: 'Description'
				evaluated: #description)
]

{ #category : 'initialization' }
IceTipCredentialsStoreBrowser >> initializePresenters [

	credentialsList := self newTable.
	self initializeCredentialsList
]

{ #category : 'accessing - ui' }
IceTipCredentialsStoreBrowser >> mainList [

	^ credentialsList
]

{ #category : 'accessing' }
IceTipCredentialsStoreBrowser >> refresh [

	credentialsList items: self model allCredentials
]

{ #category : 'accessing' }
IceTipCredentialsStoreBrowser >> store [

	^ self model
]

{ #category : 'initialization' }
IceTipCredentialsStoreBrowser >> titleForWindow [

	^ model isCurrent
		  ifTrue: [ 'Current Iceberg credentials' ]
		  ifFalse: [ 'Credentials of ' , model printString ]
]

{ #category : 'initialization' }
IceTipCredentialsStoreBrowser >> updatePresenter [

	self refresh
]
