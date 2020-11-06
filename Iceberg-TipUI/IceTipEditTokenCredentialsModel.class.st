"
I am a dialog to edit token credentials.
"
Class {
	#name : #IceTipEditTokenCredentialsModel,
	#superclass : #IceTipAddTokenCredentialsModel,
	#instVars : [
		'credentials'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #accessing }
IceTipEditTokenCredentialsModel >> credentials [

	^ credentials
]

{ #category : #accessing }
IceTipEditTokenCredentialsModel >> credentials: anIceCredentials [

	credentials := anIceCredentials.
	self refreshPresenterFromCredentials
]

{ #category : #initialization }
IceTipEditTokenCredentialsModel >> initializeWidgets [
	super initializeWidgets.
	
	hostInput disable.
]

{ #category : #accessing }
IceTipEditTokenCredentialsModel >> okAction [

	self refreshCredentialsFromPresenter.
	credentialStore storeCredential: self credentials.
	tool refresh.

]

{ #category : #accessing }
IceTipEditTokenCredentialsModel >> refreshCredentialsFromPresenter [

	credentials
		username: self usernameFromInput;
		token: self tokenFromInput;
		host: self hostnameFromInput

]

{ #category : #accessing }
IceTipEditTokenCredentialsModel >> refreshPresenterFromCredentials [

	usernameInput text: credentials username.
	tokenInput text: credentials token.
	hostInput text: credentials host.

]

{ #category : #TOREMOVE }
IceTipEditTokenCredentialsModel >> title [

	^ 'Edit token credentials'
]
