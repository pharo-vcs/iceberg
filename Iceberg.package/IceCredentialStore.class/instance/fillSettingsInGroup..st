settings
fillSettingsInGroup: aBuilder 

	plainCredentials keysAndValuesDo: [ :hostname :credential | 
		(aBuilder group: hostname)
			parent: #icebergCredentials;
			noOrdering;
			label: 'Credential for ' , hostname;
			with: [ 
				(aBuilder setting: #username)
					target: credential;
					label: 'Username';
					description: 'Your username for ' , hostname.
				(aBuilder setting: #password)
					target: credential;
					label: 'Password';
					description: 'Your password, if you want Iceberg to remember it, but be aware that this does not pretend to be safe.' , hostname.			
			]
	]