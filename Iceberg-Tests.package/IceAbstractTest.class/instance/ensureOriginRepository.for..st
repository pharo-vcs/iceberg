running
ensureOriginRepository: anOrigin for: aProjectName
	| originDirectory |
	originDirectory := FileLocator temp asFileReference / 'pharo' / 'iceberg' / aProjectName.
	originDirectory exists ifFalse: [ 
		originDirectory parent ensureCreateDirectory.
		IceGitCommand
			in: originDirectory parent  
			execute: { 
				'clone'. 
				'--bare'. 
				anOrigin . 
				aProjectName }. 
		
		(OSEnvironment default at: 'CI' ifAbsent: []) = 'true' ifTrue: [
			Transcript show: 'Setting user information for CI'; cr. 
			IceGitCommand in: originDirectory execute: { 'config'. '--global'. 'user.email'. '"npasserini@gmail.com"' }.
			IceGitCommand in: originDirectory execute: { 'config'. '--global'. 'user.name'.  '"Iceberg CI"' }
		]				
	].

	^ 'file://', originDirectory fullName.
