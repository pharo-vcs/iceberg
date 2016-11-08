running
setUp
	packageName :=  'Pharo-Git-Test'.
	projectName := 'pharo-git-test'.

	self cleanUp.

	origin := self ensureOriginRepository.	
	repository := self createTestRepository: origin.

	IceTestCredentialProvider install.
				
	(OSEnvironment default at: 'CI' ifAbsent: []) = 'true' ifTrue: [
		LGitRemote 
			usernameSsh: 'git';
			keyPassPhrase: '';
			keyFilePrivatePath: (FileLocator home asFileReference / '.ssh' / 'id_rsa') pathAsString;
			keyFilePublicPath: (FileLocator home asFileReference / '.ssh' / 'id_rsa.pub') pathAsString
	]