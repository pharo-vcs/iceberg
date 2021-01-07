"
I am the browser used to show a credentials store.
"
Class {
	#name : #IceTipCredentialsStoreBrowser,
	#superclass : #IceTipBrowser,
	#instVars : [
		'credentialsList'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #commands }
IceTipCredentialsStoreBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	{	IceTipAddPlainTextCredentialCommand.
		IceTipAddSshCredentialCommand.
		IceTipAddTokenCredentialCommand }
			do: [ :each |
				aCommandGroup register: each forSpec ]
]

{ #category : #commands }
IceTipCredentialsStoreBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	{ 	IceTipEditCredentialCommand.
		IceTipRemoveCredentialCommand }
			do: [ :each |
				aCommandGroup register: each forSpec ]

]

{ #category : #specs }
IceTipCredentialsStoreBrowser class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #credentialsList;
		  yourself
]

{ #category : #accessing }
IceTipCredentialsStoreBrowser >> credentialsList [

	^ credentialsList
]

{ #category : #initialization }
IceTipCredentialsStoreBrowser >> initialize [

	model ifNil: [ model := IceCredentialStore current ].	
	super initialize.

]

{ #category : #initialization }
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

{ #category : #initialization }
IceTipCredentialsStoreBrowser >> initializePresenters [

	credentialsList := self newTable.
	self initializeCredentialsList.

	self refresh.
]

{ #category : #'accessing ui' }
IceTipCredentialsStoreBrowser >> mainList [

	^ credentialsList
]

{ #category : #accessing }
IceTipCredentialsStoreBrowser >> refresh [

	credentialsList items: self model allCredentials
]

{ #category : #accessing }
IceTipCredentialsStoreBrowser >> store [

	^ self model
]

{ #category : #api }
IceTipCredentialsStoreBrowser >> titleForWindow [

	^ model isCurrent
		  ifTrue: [ 'Current Iceberg credentials' ]
		  ifFalse: [ 'Credentials of ' , model printString ]
]
