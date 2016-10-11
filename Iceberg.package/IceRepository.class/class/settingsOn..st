settings
settingsOn: aBuilder 
	<systemsettings>
	(aBuilder pickOne: #'defaultBackendType')
		parent: #Iceberg;
		target: self;
		label: 'Backend type';
		description: 'Select your preferred way to access git repositories from Iceberg: the git command line (OSSubprocess) or the libgit2 library';
		domainValues: {
			'git command line' -> IceMCGitRepository.
			'libgit2' -> IceLibgitLocalRepository
		}
