"
I am a dialog to ask for SSH credentials.
"
Class {
	#name : #IceTipAskSSHCredentialsModel,
	#superclass : #IceTipEditSSHCredentialsModel,
	#category : #'Iceberg-TipUI-Credentials'
}

{ #category : #actions }
IceTipAskSSHCredentialsModel >> accept [

	^ self acceptAskAction
]

{ #category : #actions }
IceTipAskSSHCredentialsModel >> cancelAction [

	self cancelAskAction
]
