running
setUp
	| originDirectory |
	packageName :=  'Pharo-Git-Test'.
	projectName := 'pharo-git-test'.

	originDirectory := FileLocator temp asFileReference / 'pharo' / 'iceberg' / projectName.
	originDirectory exists ifFalse: [ 
		origin parent ensureCreateDirectory.
		IceGitCommand 
			in: origin parent  
			execute: { 
				'clone'. 
				'--bare'. 
				'https://github.com/npasserini/{1}.git' format: { projectName }. 
				projectName }. 
				
		IceGitCommand in: origin execute: { 'config'. 'user.email'. '"npasserini@gmail.com"' }.
		IceGitCommand in: origin execute: { 'config'. 'user.name'.  '"Nicolás Passerini"' }
	].

	origin := 'file://', originDirectory fullName.
	repository := self createTestRepository: origin.
	
	self removeTempDirectories.
	self removeTestPackages.
