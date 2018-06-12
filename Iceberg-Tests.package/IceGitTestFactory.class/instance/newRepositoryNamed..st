initialization
newRepositoryNamed: projectName

	| repository |
	(self location / projectName) ensureDeleteAll.
	repository := IceRepositoryCreator new 
			location: self location / projectName;
			createNewRepositoryNamed: projectName.
			
	(OSEnvironment default at: 'CI' ifAbsent: []) = 'true' ifTrue: [	
		Transcript show: 'Setting user information for CI'; cr.
		IceGitCommand in: repository location execute: { 'config'. '--global'. 'user.email'. '"npasserini@gmail.com"' }.
		IceGitCommand in: repository location execute: { 'config'. '--global'. 'user.name'.  '"Iceberg CI"' }
	].

	repository workingCopy: (IceRingWorkingCopy fromWorkingCopy: repository workingCopy).
	^ repository