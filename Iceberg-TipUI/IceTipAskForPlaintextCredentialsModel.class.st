"
I implement the dialog to ask plaintext credentials.
This dialog is used when the IceTipInteractiveCredentialsProvider needs to ask a plaintext credential.
"
Class {
	#name : #IceTipAskForPlaintextCredentialsModel,
	#superclass : #IceTipAbstractPlaintextCredentialsModel,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #specs }
IceTipAskForPlaintextCredentialsModel class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newHorizontal
				   add: #usernameLabel
				   width: 80 * self currentWorld displayScaleFactor;
				   add: #usernameInput;
				   yourself)
		  height: self inputTextHeight;
		  add: (SpBoxLayout newHorizontal
				   add: #passwordLabel
				   width: 80 * self currentWorld displayScaleFactor;
				   add: #passwordInput;
				   yourself)
		  height: self inputTextHeight;
		  add: #storeCheckbox height: self inputTextHeight
]

{ #category : #actions }
IceTipAskForPlaintextCredentialsModel >> accept [

	^ self acceptAskAction
]

{ #category : #actions }
IceTipAskForPlaintextCredentialsModel >> cancelAction [

	self cancelAskAction
]

{ #category : #initialization }
IceTipAskForPlaintextCredentialsModel >> initialExtentForWindow [

	^ (350 @ (self class inputTextHeight * 5 + self class buttonHeight))
		  scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipAskForPlaintextCredentialsModel >> titleForWindow [

	^ 'Please log in to ' , askingHostname
]
