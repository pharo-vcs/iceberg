"
I am a dialog to add token credentials.
"
Class {
	#name : #IceTipAddTokenCredentialsModel,
	#superclass : #IceTipAbstractAskCredentialsModel,
	#instVars : [
		'hostInput',
		'tokenInput',
		'tokenLabel',
		'hostLabel'
	],
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #specs }
IceTipAddTokenCredentialsModel class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #hostLabel width: self labelWidth;
				add: #hostInput;
				yourself)
			height: self inputTextHeight;
		add:
			(SpBoxLayout newHorizontal
				add: #tokenLabel width: self labelWidth;
				add: #tokenInput;
				yourself)
			height: self inputTextHeight;
		yourself
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> accept [

	self acceptAddAction
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> hostnameFromInput [
	
	^ hostInput text
]

{ #category : #testing }
IceTipAddTokenCredentialsModel >> initialExtent [

	^ (350 @ (self class inputTextHeight * 4 + self class buttonHeight)) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipAddTokenCredentialsModel >> initializePresenters [

	super initializePresenters.
	hostLabel := self newLabel label: 'Host: '.
	hostInput := self newTextInput
		placeholder: 'github.com';
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself.
	tokenLabel := self newLabel label: 'Token: '.
	tokenInput := self newTextInput
		autoAccept: true;
		whenTextChangedDo: [ self updateOkButton ];
		yourself.

]

{ #category : #testing }
IceTipAddTokenCredentialsModel >> isOkEnabled [

	^ self hostnameFromInput isNotEmpty and: [ self tokenFromInput isNotEmpty ]
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> newCredentials [
	
	^ IceTokenCredentials new
		token: self tokenFromInput;
		host: self hostnameFromInput;
		yourself 
]

{ #category : #initialization }
IceTipAddTokenCredentialsModel >> putFocusOrder [

	self focusOrder
		add: hostInput;
		add: tokenInput
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> title [

	^ 'Add token credentials'
]

{ #category : #accessing }
IceTipAddTokenCredentialsModel >> tokenFromInput [
	
	^ tokenInput text
]
