as yet unclassified
settingsOn: aBuilder 
	<systemsettings>

	(aBuilder group: #'GitHub Credentials')
		parent: #Iceberg;
		iconName: #github;
		noOrdering;
		with: [ 
			(aBuilder setting: #userName)
				target: self;
				label: 'GitHub Plain Text Username';
				description: 'Your GitHub username'.

			(aBuilder setting: #password)
				target: self;
				type: #Password;
				label: 'Your GitHub password, if you want Iceberg to remember it, but be aware that this does not pretend to be safe.'.
		]