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

{ #category : #specs }
IceTipCredentialsStoreBrowser class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
		add: #toolbar expand: false fill: true padding: 0;
		add: #credentialsList;
		yourself 
]

{ #category : #accessing }
IceTipCredentialsStoreBrowser >> contextClass [
	^ IceTipCredentialsStoreContext
]

{ #category : #'private factory' }
IceTipCredentialsStoreBrowser >> createCommandContext [
	^ self newContextWithSelection: self credentialSelected.
]

{ #category : #'private factory' }
IceTipCredentialsStoreBrowser >> createCommandContextForSelection: selectedItems [
	^ self newContextWithSelection: selectedItems
]

{ #category : #accessing }
IceTipCredentialsStoreBrowser >> credentialSelected [
^	credentialsList selection selectedItem
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
			(SpStringTableColumn new
				title: 'Type';
				evaluated: #type;
				width: 75 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			(SpStringTableColumn new
				title: 'Description';
				evaluated: #description;
				yourself);
		items: self model allCredentials;
		selectIndex: 1;
		contextMenu: [ self buildMenu]
]

{ #category : #initialization }
IceTipCredentialsStoreBrowser >> initializeWidgets [
	super initializeWidgets.
	credentialsList := self newTable.
	self initializeCredentialsList.
	self focusOrder add: credentialsList
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

{ #category : #api }
IceTipCredentialsStoreBrowser >> title [
	^ model isCurrent
		ifTrue: [ 'Current Iceberg credentials' ]
		ifFalse: [ 'Credentials of ' , model printString ]
]
