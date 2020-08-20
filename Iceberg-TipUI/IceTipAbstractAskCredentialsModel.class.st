"
I implement the basic behavior of all the dialogs 
to ask / add / edit credentials.

There are subclasses to each of the actions and the types of keys.
"
Class {
	#name : #IceTipAbstractAskCredentialsModel,
	#superclass : #IceTipDialog,
	#instVars : [
		'storeCheckbox',
		'credentialStore',
		'accepted',
		'tool',
		'credentials',
		'askingHostname'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #specs }
IceTipAbstractAskCredentialsModel class >> title [
	^ 'Default Title'
]

{ #category : #actions }
IceTipAbstractAskCredentialsModel >> accept [
	^ self subclassResponsibility
]

{ #category : #actions }
IceTipAbstractAskCredentialsModel >> acceptAddAction [

	credentials := self newCredentials.

	credentialStore
		storeCredential: credentials
		forHostname: self hostnameFromInput.

	accepted := true.
	tool refresh
]

{ #category : #actions }
IceTipAbstractAskCredentialsModel >> acceptAskAction [

	credentials := self newCredentials.

	self shouldStoreCredentials ifTrue: [ 
		credentialStore
			storeCredential: credentials
			forHostname: askingHostname ].

	accepted := true.
	^ credentials
]

{ #category : #actions }
IceTipAbstractAskCredentialsModel >> acceptEditAction [

	self refreshCredentialsFromPresenter.
	credentialStore storeCredential: self credentials.
	tool ifNotNil: #refresh.
	accepted := true.
	^ credentials
]

{ #category : #accessing }
IceTipAbstractAskCredentialsModel >> askingHostname: aString [

	askingHostname := aString

]

{ #category : #actions }
IceTipAbstractAskCredentialsModel >> cancelAction [
	"Action to execute on cancel."
]

{ #category : #actions }
IceTipAbstractAskCredentialsModel >> cancelAskAction [

	accepted := true.
	self window close.
	LGitNoCredentialsProvided signal
]

{ #category : #actions }
IceTipAbstractAskCredentialsModel >> closeAction [
	accepted ifFalse: [ self cancelAction ]
]

{ #category : #initialization }
IceTipAbstractAskCredentialsModel >> connectPresenters [
	self putFocusOrder
]

{ #category : #accessing }
IceTipAbstractAskCredentialsModel >> credentialStore: aStore [ 
	credentialStore := aStore
]

{ #category : #accessing }
IceTipAbstractAskCredentialsModel >> credentials [
	^ credentials
]

{ #category : #accessing }
IceTipAbstractAskCredentialsModel >> credentials: anIceCredentials [

	credentials := anIceCredentials.
	self refreshPresenterFromCredentials
]

{ #category : #accessing }
IceTipAbstractAskCredentialsModel >> hostnameFromInput [
	"Answer the remoote hostname for the credentials."

	^ self subclassResponsibility
]

{ #category : #initialization }
IceTipAbstractAskCredentialsModel >> initialize [
	super initialize.
	accepted := false
]

{ #category : #accessing }
IceTipAbstractAskCredentialsModel >> initializeDialogWindow: aDialogWindowPresenter [

	super initializeDialogWindow: aDialogWindowPresenter.
	aDialogWindowPresenter title: self title.
	self updateOkButton
]

{ #category : #initialization }
IceTipAbstractAskCredentialsModel >> initializePresenters [
	storeCheckbox := self newCheckBox
		label: 'Do you want this credentials to be stored for future use?';
		help: 'Please note that storing your credentials is handy but unsafe';
		state: true.

]

{ #category : #testing }
IceTipAbstractAskCredentialsModel >> isOkEnabled [
	"Determite if the user should be enabled to press on the accept button."
	
	^ self subclassResponsibility
]

{ #category : #accessing }
IceTipAbstractAskCredentialsModel >> newCredentials [
	"Answer a new instance of the credentials using the form inputs."

	^ self subclassResponsibility
]

{ #category : #updating }
IceTipAbstractAskCredentialsModel >> okButton [

	^ self window buttons first
]

{ #category : #'API - opening' }
IceTipAbstractAskCredentialsModel >> open [
	self
		openNonModal
		modalRelativeTo: self currentWorld.
	
	^ self credentials
]

{ #category : #'API - opening' }
IceTipAbstractAskCredentialsModel >> openNonModal [

	^ self openDialogWithSpec
		  okAction: [ self accept ];
		  cancelAction: [ self cancelAction ];
		  whenClosedDo: [ self closeAction ];
		  centered
]

{ #category : #initialization }
IceTipAbstractAskCredentialsModel >> putFocusOrder [
	^ self subclassResponsibility 
]

{ #category : #accessing }
IceTipAbstractAskCredentialsModel >> refreshCredentialsFromPresenter [
	"Hook to update the credentials object from the presenter inputs."
]

{ #category : #accessing }
IceTipAbstractAskCredentialsModel >> refreshPresenterFromCredentials [
	"Hook to update the presenter input fields from the credentials object."
]

{ #category : #testing }
IceTipAbstractAskCredentialsModel >> shouldStoreCredentials [
	^ storeCheckbox state 
]

{ #category : #accessing }
IceTipAbstractAskCredentialsModel >> tool: aBrowser [ 
	tool := aBrowser
]

{ #category : #updating }
IceTipAbstractAskCredentialsModel >> updateOkButton [	
	self window ifNil: [ ^ self ].	
	self okButton enabled: self isOkEnabled
]
