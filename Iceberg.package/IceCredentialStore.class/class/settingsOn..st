accessing
settingsOn: aBuilder
	<systemsettings>
		
	(aBuilder group: #PlainTextCredentials)
		parent: #Iceberg;
		name: #icebergCredentials;
		noOrdering;
		target: self current;
		label: 'Plain Text Credentials';
		with: [
			(aBuilder setting: #storeFile)
				target: self;
				type: #FilePathEncoder;
				label: 'Location of credentials store';
				description: 'The location of the credential store. The password are stored in plain... yet'.
		].	
