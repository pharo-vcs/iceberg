"
I am a dialog to edit token credentials.
"
Class {
	#name : #IceTipEditTokenCredentialsModel,
	#superclass : #IceTipAddTokenCredentialsModel,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #accessing }
IceTipEditTokenCredentialsModel >> accept [

	^ self acceptEditAction
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

{ #category : #initialization }
IceTipEditTokenCredentialsModel >> titleForWindow [

	^ 'Edit token credentials'
]
