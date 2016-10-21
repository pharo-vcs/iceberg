settings
settingsOn: aBuilder 
	<systemsettings>
	(aBuilder setting: #'uploadChangesOnCommit')
		parent: #Iceberg;
		target: self;
		label: 'Upload changes on commit';
		description: 'If selected your code will be uploaded by default on each commit (if possible)'
