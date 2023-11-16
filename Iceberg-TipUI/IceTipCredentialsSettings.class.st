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

	(aBuilder group: #EditCredentials)
		parent: #icebergCredentials;
		noOrdering;
		target: self;
		label: 'Current list of credentials';
		dialog: [
			PluggableButtonMorph
				on: self
				getState: nil
				action: #editButtonAction
				label: #editButtonLabel ]
]
