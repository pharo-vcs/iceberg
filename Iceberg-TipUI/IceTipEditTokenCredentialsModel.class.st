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
		token: self tokenFromInput;
		host: self hostnameFromInput
]

{ #category : #accessing }
IceTipEditTokenCredentialsModel >> refreshPresenterFromCredentials [

	tokenInput text: credentials token.
	hostInput text: credentials host
]

{ #category : #TOREMOVE }
IceTipEditTokenCredentialsModel >> title [

	^ 'Edit token credentials'
]
