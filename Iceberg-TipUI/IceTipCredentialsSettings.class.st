Class {
	#name : 'IceTipCredentialsSettings',
	#superclass : 'Object',
	#category : 'Iceberg-TipUI-Credentials',
	#package : 'Iceberg-TipUI',
	#tag : 'Credentials'
}

{ #category : 'settings' }
IceTipCredentialsSettings class >> editButtonAction [

	IceTipCredentialsStoreBrowser new open.
]

{ #category : 'settings' }
IceTipCredentialsSettings class >> editButtonLabel [
	^ 'Edit'
]

{ #category : 'settings' }
IceTipCredentialsSettings class >> editButtonState [
	^ true
]

{ #category : 'settings' }
IceTipCredentialsSettings class >> settingsOn: aBuilder [
	<systemsettings>

	(aBuilder button: #editButtonAction)
		parent: #icebergCredentials;
		noOrdering;
		target: self;
		label: 'Current list of credentials';
		buttonLabel: self editButtonLabel 
]
