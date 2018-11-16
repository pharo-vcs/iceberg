settings
settingsOn: aBuilder
	<systemsettings>
		
	(aBuilder group: #EditCredentials)
		parent: #icebergCredentials;
		noOrdering;
		target: self;
		label: 'Edit Credentials';
		dialog: [ 	
				PluggableButtonMorph
					on: self
					getState: nil
					action: #editButtonAction
					label: #editButtonLabel ]

