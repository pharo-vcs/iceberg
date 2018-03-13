settings
settingsOn: aBuilder 
	<systemsettings>
	
	(aBuilder pickOne: #'defaultFileFormatType')
		parent: #Iceberg;
		target: self;
		label: 'File format type';
		description: 'Select your preferred file format.';
		domainValues: self formatTypeDomainValues.
  
	(aBuilder setting: #'defaultCodeSubdirectory')
		parent: #Iceberg;
		target: self;
		label: 'Default Code Subdirectory';
		description: 'Select your preferred source code folder name'.

	(aBuilder setting: #shareRepositoriesBetweenImages)
		parent: #Iceberg;
		target: self;
		label: 'Share repositories between images';
		description: 'Check if you want to have your git repositories cloned by default in a single location that is shared between all your Pharo images';
		with: [
			(aBuilder setting: #sharedRepositoriesLocationString)
				target: self;
				type: #Directory;
				label: 'Location for shared repositories';
				description: 'A directory where you have your git repositories'.
		].
		