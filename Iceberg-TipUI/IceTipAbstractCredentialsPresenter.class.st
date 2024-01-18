"
I implement the basic behavior of all the dialogs 
to ask / add / edit credentials.

There are subclasses to each of the actions and the types of keys.
"
Class {
	#name : 'IceTipAbstractCredentialsPresenter',
	#superclass : 'IceTipDialogPresenter',
	#instVars : [
		'storeCheckbox',
		'credentialStore',
		'accepted',
		'tool',
		'credentials',
		'askingHostname'
	],
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'actions' }
IceTipAbstractCredentialsPresenter >> acceptAddAction [

	credentials := self newCredentials.

	credentialStore
		storeCredential: credentials
		forHostname: self hostnameFromInput.

	accepted := true.
	tool refresh
]

{ #category : 'actions' }
IceTipAbstractCredentialsPresenter >> acceptAskAction [

	credentials := self newCredentials.

	self shouldStoreCredentials ifTrue: [ 
		credentialStore
			storeCredential: credentials
			forHostname: askingHostname ].

	accepted := true.
	^ credentials
]

{ #category : 'actions' }
IceTipAbstractCredentialsPresenter >> acceptEditAction [

	self refreshCredentialsFromPresenter.
	credentialStore storeCredential: self credentials.
	tool ifNotNil: [ tool refresh ].
	accepted := true.
	^ credentials
]

{ #category : 'accessing' }
IceTipAbstractCredentialsPresenter >> askingHostname: aString [

	askingHostname := aString

]

{ #category : 'actions' }
IceTipAbstractCredentialsPresenter >> cancelAction [
	"Action to execute on cancel."
]

{ #category : 'actions' }
IceTipAbstractCredentialsPresenter >> cancelAskAction [

	accepted := true.
	self closeWindow.
	LGitNoCredentialsProvided signal
]

{ #category : 'actions' }
IceTipAbstractCredentialsPresenter >> closeAction [

	accepted ifFalse: [ self cancelAction ]
]

{ #category : 'accessing' }
IceTipAbstractCredentialsPresenter >> credentialStore: aStore [ 
	credentialStore := aStore
]

{ #category : 'accessing' }
IceTipAbstractCredentialsPresenter >> credentials [
	^ credentials
]

{ #category : 'accessing' }
IceTipAbstractCredentialsPresenter >> credentials: anIceCredentials [

	credentials := anIceCredentials.
	self refreshPresenterFromCredentials
]

{ #category : 'accessing' }
IceTipAbstractCredentialsPresenter >> hostnameFromInput [
	"Answer the remoote hostname for the credentials."

	^ self subclassResponsibility
]

{ #category : 'initialization' }
IceTipAbstractCredentialsPresenter >> initialize [
	super initialize.
	accepted := false
]

{ #category : 'initialization' }
IceTipAbstractCredentialsPresenter >> initializeDialogWindow: aDialogWindowPresenter [

	super initializeDialogWindow: aDialogWindowPresenter.
	self updateOkButton.

	aDialogWindowPresenter whenClosedDo: [ 
		accepted ifFalse: [ self cancelAskAction ] ]
]

{ #category : 'initialization' }
IceTipAbstractCredentialsPresenter >> initializePresenters [

	storeCheckbox := self newCheckBox
		label: 'Do you want this credentials to be stored for future use?';
		help: 'Please note that storing your credentials is handy but unsafe';
		state: true.

]

{ #category : 'testing' }
IceTipAbstractCredentialsPresenter >> isOkEnabled [
	"Determite if the user should be enabled to press on the accept button."
	
	^ self subclassResponsibility
]

{ #category : 'accessing' }
IceTipAbstractCredentialsPresenter >> newCredentials [
	"Answer a new instance of the credentials using the form inputs."

	^ self subclassResponsibility
]

{ #category : 'updating' }
IceTipAbstractCredentialsPresenter >> okButton [

	^ self window buttons first
]

{ #category : 'API - opening' }
IceTipAbstractCredentialsPresenter >> open [

	self openModal.
	
	^ self credentials
]

{ #category : 'accessing' }
IceTipAbstractCredentialsPresenter >> refreshCredentialsFromPresenter [
	"Hook to update the credentials object from the presenter inputs."
]

{ #category : 'accessing' }
IceTipAbstractCredentialsPresenter >> refreshPresenterFromCredentials [
	"Hook to update the presenter input fields from the credentials object."
]

{ #category : 'testing' }
IceTipAbstractCredentialsPresenter >> shouldStoreCredentials [

	^ storeCheckbox state
]

{ #category : 'accessing' }
IceTipAbstractCredentialsPresenter >> storeCheckbox [

	^ storeCheckbox
]

{ #category : 'accessing' }
IceTipAbstractCredentialsPresenter >> tool: aBrowser [
	"Set the tool that triggered this dialog, and therefore might need a #refresh after the users accepts the dialog and it produces an effect on the system."

	tool := aBrowser
]

{ #category : 'updating' }
IceTipAbstractCredentialsPresenter >> updateOkButton [

	self window ifNil: [ ^ self ].
	self okButton enabled: self isOkEnabled
]
