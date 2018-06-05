settings
settingsOn: aBuilder 
	<systemsettings>
	(aBuilder setting: #useCustomSsh)
		parent: #Iceberg;
		noOrdering;
		target: self;
		label: 'Use custom SSH keys';
		description: 'Check if you want to have your own pair of keys (id_rsa and id_rsa.pub), without using the ssh-agent'.
