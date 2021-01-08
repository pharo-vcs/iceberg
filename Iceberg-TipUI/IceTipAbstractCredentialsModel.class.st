"
I implement the basic behavior of all the dialogs 
to ask / add / edit credentials.

There are subclasses to each of the actions and the types of keys.
"
Class {
	#name : #IceTipAbstractCredentialsModel,
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

{ #category : #actions }
IceTipAbstractCredentialsModel >> acceptAddAction [

	credentials := self newCredentials.

	credentialStore
		storeCredential: credentials
		forHostname: self hostnameFromInput.

	accepted := true.
	tool refresh
]

{ #category : #actions }
IceTipAbstractCredentialsModel >> acceptAskAction [

	credentials := self newCredentials.

	self shouldStoreCredentials ifTrue: [ 
		credentialStore
			storeCredential: credentials
			forHostname: askingHostname ].

	accepted := true.
	^ credentials
]

{ #category : #actions }
IceTipAbstractCredentialsModel >> acceptEditAction [

	self refreshCredentialsFromPresenter.
	credentialStore storeCredential: self credentials.
	tool ifNotNil: #refresh.
	accepted := true.
	^ credentials
]

{ #category : #accessing }
IceTipAbstractCredentialsModel >> askingHostname: aString [

	askingHostname := aString

]

{ #category : #actions }
IceTipAbstractCredentialsModel >> cancelAction [
	"Action to execute on cancel."
]

{ #category : #actions }
IceTipAbstractCredentialsModel >> cancelAskAction [

	accepted := true.
	self closeWindow.
	LGitNoCredentialsProvided signal
]

{ #category : #actions }
IceTipAbstractCredentialsModel >> closeAction [

	accepted ifFalse: [ self cancelAction ]
]

{ #category : #accessing }
IceTipAbstractCredentialsModel >> credentialStore: aStore [ 
	credentialStore := aStore
]

{ #category : #accessing }
IceTipAbstractCredentialsModel >> credentials [
	^ credentials
]

{ #category : #accessing }
IceTipAbstractCredentialsModel >> credentials: anIceCredentials [

	credentials := anIceCredentials.
	self refreshPresenterFromCredentials
]

{ #category : #accessing }
IceTipAbstractCredentialsModel >> hostnameFromInput [
	"Answer the remoote hostname for the credentials."

	^ self subclassResponsibility
]

{ #category : #initialization }
IceTipAbstractCredentialsModel >> initialize [
	super initialize.
	accepted := false
]

{ #category : #accessing }
IceTipAbstractCredentialsModel >> initializeDialogWindow: aDialogWindowPresenter [

	super initializeDialogWindow: aDialogWindowPresenter.
	self updateOkButton
]

{ #category : #initialization }
IceTipAbstractCredentialsModel >> initializePresenters [
	storeCheckbox := self newCheckBox
		label: 'Do you want this credentials to be stored for future use?';
		help: 'Please note that storing your credentials is handy but unsafe';
		state: true.

]

{ #category : #testing }
IceTipAbstractCredentialsModel >> isOkEnabled [
	"Determite if the user should be enabled to press on the accept button."
	
	^ self subclassResponsibility
]

{ #category : #accessing }
IceTipAbstractCredentialsModel >> newCredentials [
	"Answer a new instance of the credentials using the form inputs."

	^ self subclassResponsibility
]

{ #category : #updating }
IceTipAbstractCredentialsModel >> okButton [

	^ self window buttons first
]

{ #category : #'API - opening' }
IceTipAbstractCredentialsModel >> open [
	self
		openNonModal
		modalRelativeTo: self currentWorld.
	
	^ self credentials
]

{ #category : #'API - opening' }
IceTipAbstractCredentialsModel >> openNonModal [

	^ self openDialogWithSpec
		  okAction: [ self accept ];
		  cancelAction: [ self cancelAction ];
		  whenClosedDo: [ self closeAction ];
		  centered
]

{ #category : #accessing }
IceTipAbstractCredentialsModel >> refreshCredentialsFromPresenter [
	"Hook to update the credentials object from the presenter inputs."
]

{ #category : #accessing }
IceTipAbstractCredentialsModel >> refreshPresenterFromCredentials [
	"Hook to update the presenter input fields from the credentials object."
]

{ #category : #testing }
IceTipAbstractCredentialsModel >> shouldStoreCredentials [

	^ storeCheckbox state
]

{ #category : #accessing }
IceTipAbstractCredentialsModel >> storeCheckbox [

	^ storeCheckbox
]

{ #category : #accessing }
IceTipAbstractCredentialsModel >> tool: aBrowser [
	"Set the tool that triggered this dialog, and therefore might need a #refresh after the users accepts the dialog and it produces an effect on the system."

	tool := aBrowser
]

{ #category : #updating }
IceTipAbstractCredentialsModel >> updateOkButton [

	self window ifNil: [ ^ self ].
	self okButton enabled: self isOkEnabled
]
