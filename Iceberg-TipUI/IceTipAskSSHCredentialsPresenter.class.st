"
I am a dialog to ask for SSH credentials.
"
Class {
	#name : 'IceTipAskSSHCredentialsPresenter',
	#superclass : 'IceTipEditSSHCredentialsPresenter',
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'actions' }
IceTipAskSSHCredentialsPresenter >> accept [

	^ self acceptAskAction
]

{ #category : 'actions' }
IceTipAskSSHCredentialsPresenter >> cancelAction [

	self cancelAskAction
]

{ #category : 'accessing' }
IceTipAskSSHCredentialsPresenter >> newCredentials [

	self refreshCredentialsFromPresenter.
	^ credentials
]
