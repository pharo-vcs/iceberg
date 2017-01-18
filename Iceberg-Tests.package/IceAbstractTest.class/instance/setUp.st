running
setUp
	super setUp.
	IceAbstractModel subclassesDo: #clearModels.
	Smalltalk garbageCollect. "Force weaks to be cleaned"
	
	projectName := 'pharo-git-test'.
	packageName :=  'Pharo-Git-Test'.
	otherPackageName :=  'IcebergTestPackage2'.

	self cleanUp.

	origin := self ensureOriginRepository.	
	repository := self createTestRepository: origin.

	IceTestCredentialProvider install.

	(OSEnvironment default at: 'CI' ifAbsent: []) = 'true' ifTrue: [
		LGitRemote 
			usernameSsh: 'git';
			keyPassPhrase: '';
			keyFilePrivatePath: (FileLocator home asFileReference / '.ssh' / 'id_rsa') pathString;
			keyFilePublicPath: (FileLocator home asFileReference / '.ssh' / 'id_rsa.pub') pathString
	].