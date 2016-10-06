settings
settingsOn: aBuilder 
	<systemsettings>
	(aBuilder group: #Iceberg)
		parent: #SCM;
		with: [ 
			(aBuilder setting: #'enableMetacelloIntegration')
				target: self;
				label: 'Enable Metacello integration';
				description: 'If selected, Metacello github// repositories will be loaded using iceberg'
"				icon: (Smalltalk ui icons iconNamed: #smallConfigurationIcon);"
		]