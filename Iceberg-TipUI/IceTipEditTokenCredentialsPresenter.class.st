"
I am a dialog to edit token credentials.
"
Class {
	#name : 'IceTipEditTokenCredentialsPresenter',
	#superclass : 'IceTipAddTokenCredentialsPresenter',
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'accessing' }
IceTipEditTokenCredentialsPresenter >> accept [

	^ self acceptEditAction
]

{ #category : 'accessing' }
IceTipEditTokenCredentialsPresenter >> refreshCredentialsFromPresenter [

	credentials
		username: self usernameFromInput;
		token: self tokenFromInput;
		host: self hostnameFromInput

]

{ #category : 'accessing' }
IceTipEditTokenCredentialsPresenter >> refreshPresenterFromCredentials [

	usernameInput text: credentials username.
	tokenInput text: credentials token.
	hostInput text: credentials host.

]

{ #category : 'initialization' }
IceTipEditTokenCredentialsPresenter >> titleForWindow [

	^ 'Edit token credentials'
]
