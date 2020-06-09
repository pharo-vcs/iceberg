"
I implement the dialog to edit plaintext credentials.
"
Class {
	#name : #IceTipEditPlaintextCredentialsModel,
	#superclass : #IceTipAbstractPlaintextCredentialsModel,
	#instVars : [
		'tool',
		'credential'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #specs }
IceTipEditPlaintextCredentialsModel class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #usernameLabel width: 80 * self currentWorld displayScaleFactor;
				add: #usernameInput;
				yourself) height: self inputTextHeight ;
		add:
			(SpBoxLayout newHorizontal 
				add: #passwordLabel width: 80 * self currentWorld displayScaleFactor;
				add: #passwordInput;
				yourself) height: self inputTextHeight ;
		yourself
]

{ #category : #actions }
IceTipEditPlaintextCredentialsModel >> accept [ 
	self credentials
		username: self username;
		password: self password.
	credentialStore storeCredential: self credentials.
	tool refresh
]

{ #category : #actions }
IceTipEditPlaintextCredentialsModel >> cancelAction [
	" I do not nothing "
]

{ #category : #accessing }
IceTipEditPlaintextCredentialsModel >> credentials [
	^ credential
]

{ #category : #accessing }
IceTipEditPlaintextCredentialsModel >> credentials: aPlainTextCredential [ 

	credential := aPlainTextCredential.
	
	self usernameInput text: credential username.
	self passwordInput text: credential password.
	
]

{ #category : #api }
IceTipEditPlaintextCredentialsModel >> initialExtent [
	^ (350 @ (self class inputTextHeight * 4 + self class buttonHeight)) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipEditPlaintextCredentialsModel >> putFocusOrder [

	self focusOrder
		add: usernameInput;
		add: passwordInput.
]

{ #category : #accessing }
IceTipEditPlaintextCredentialsModel >> title [
	^ 'Edit credential for ' , credential host
]

{ #category : #accessing }
IceTipEditPlaintextCredentialsModel >> tool: aBrowser [ 
	tool := aBrowser
]
