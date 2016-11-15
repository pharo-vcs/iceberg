actions
providePlaintextCredentialsTo: credentials
	tries := tries + 1.

	tries >= 3 ifTrue: [ 
		Transcript show: 'aborting'; cr.
		IceNoCredentialsProvided signal: 'There where already three failed attempts, aborting' ].
	
	tries = 1 & self areStoredPlaintextCredentialsPresent
		ifTrue: [ self provideStoredPlaintextCredentialsTo: credentials ]
		ifFalse: [ self askForPlaintextCredentials: credentials ].

