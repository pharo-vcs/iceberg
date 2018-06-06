accessing
settingsOn: aBuilder
	<systemsettings>
		
	(aBuilder group: #PlainTextCredentials)
		parent: #Iceberg;
		name: #icebergCredentials;
		noOrdering;
		target: self current;
		label: 'Plain Text Credentials';
		dialog: [ self current settingsAddButton ];
		with: [ self current fillSettingsInGroup: aBuilder ].	
