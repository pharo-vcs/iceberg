events
commited: newCommit changingPackages: packages
	packages do: [ :package | self versionLoaded: (newCommit versionFor: package) ].
	referenceCommit := newCommit.
	repository announcer announce: IceCommited new.
