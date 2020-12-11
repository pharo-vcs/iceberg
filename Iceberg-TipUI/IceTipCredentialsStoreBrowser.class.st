"
I am the browser used to show a credentials store.
"
Class {
	#name : #IceTipCredentialsStoreBrowser,
	#superclass : #IceTipBrowser2,
	#instVars : [
		'credentialsList'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #specs }
IceTipCredentialsStoreBrowser class >> defaultSpec [
	<spec: #default>

	^ SpBoxLayout newVertical
		  add: #credentialsList;
		  yourself
]

{ #category : #accessing }
IceTipCredentialsStoreBrowser >> contextClass [

	^ IceTipCredentialsStoreContext
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
				evaluated: #description);
		items: self model allCredentials;
		selectIndex: 1;
		contextMenu: [ self newMenuForList ];
		contextKeyBindings: self newKeyBindingsForList.

]

{ #category : #initialization }
IceTipCredentialsStoreBrowser >> initializePresenters [

	credentialsList := self newTable.
	self initializeCredentialsList.

]

{ #category : #accessing }
IceTipCredentialsStoreBrowser >> mainList [

	^ credentialsList
]

{ #category : #'private factory' }
IceTipCredentialsStoreBrowser >> newContextWithSelection: anObject [ 

	^ IceTipCredentialContext new
		store: model;
		credential: anObject;
		tool: self;
		yourself
]

{ #category : #accessing }
IceTipCredentialsStoreBrowser >> refresh [

	credentialsList items: self model allCredentials
]

{ #category : #commands }
IceTipCredentialsStoreBrowser >> registerCommandsForSelectionInto: aCommandGroup context: aContext [

	{ 	IceTipEditCredentialCommand.
		IceTipRemoveCredentialCommand }
			do: [ :each |
				aCommandGroup register: 
					(each forSpecContext: aContext) ]

]

{ #category : #commands }
IceTipCredentialsStoreBrowser >> registerToolbarCommandsInto: aCommandGroup context: aContext [

	{	IceTipAddPlainTextCredentialCommand.
		IceTipAddSshCredentialCommand.
		IceTipAddTokenCredentialCommand }
			do: [ :each |
				aCommandGroup register: (each forSpecContext: aContext) ]
]

{ #category : #api }
IceTipCredentialsStoreBrowser >> titleForWindow [

	^ model isCurrent
		  ifTrue: [ 'Current Iceberg credentials' ]
		  ifFalse: [ 'Credentials of ' , model printString ]
]
