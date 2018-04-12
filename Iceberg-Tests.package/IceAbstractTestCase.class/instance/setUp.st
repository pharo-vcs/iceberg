running
setUp

	super setUp.
	(OSEnvironment default at: 'CI' ifAbsent: []) = 'true' ifTrue: [
		LGitRemote 
			usernameSsh: 'git';
			keyPassPhrase: '';
			keyFilePrivatePath: (FileLocator home asFileReference / '.ssh' / 'id_rsa') pathString;
			keyFilePublicPath: (FileLocator home asFileReference / '.ssh' / 'id_rsa.pub') pathString
	].