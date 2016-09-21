running
setUp
	| originDirectory |
	packageName :=  'Pharo-Git-Test'.
	projectName := 'pharo-git-test'.

	originDirectory := FileLocator temp asFileReference / 'pharo' / 'iceberg' / projectName.
	originDirectory exists ifFalse: [ 
		originDirectory parent ensureCreateDirectory.
		IceGitCommand 
			in: originDirectory parent  
			execute: { 
				'clone'. 
				'--bare'. 
				'https://github.com/npasserini/{1}.git' format: { projectName }. 
				projectName }. 
		
		(OSEnvironment default at: 'CI') = 'true' ifTrue: [ 
			IceGitCommand in: originDirectory execute: { 'config'. '-global'. 'user.email'. '"npasserini@gmail.com"' }.
			IceGitCommand in: originDirectory execute: { 'config'. '-global'. 'user.name'.  '"Iceberg CI"' }
		]				
	].

	origin := 'file://', originDirectory fullName.
	repository := self createTestRepository: origin.
	
	self removeTempDirectories.
	self removeTestPackages.
