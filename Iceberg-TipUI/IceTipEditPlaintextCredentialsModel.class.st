"
I implement the dialog to edit plaintext credentials.
"
Class {
	#name : #IceTipEditPlaintextCredentialsModel,
	#superclass : #IceTipAbstractPlaintextCredentialsModel,
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
	
	^ self acceptEditAction
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

{ #category : #actions }
IceTipEditPlaintextCredentialsModel >> refreshCredentialsFromPresenter [

	credentials
		username: self username;
		password: self password
]

{ #category : #accessing }
IceTipEditPlaintextCredentialsModel >> refreshPresenterFromCredentials [

	usernameInput text: credentials username.
	passwordInput text: credentials password
]

{ #category : #accessing }
IceTipEditPlaintextCredentialsModel >> title [

	^ 'Edit credential for ' , credentials host
]
