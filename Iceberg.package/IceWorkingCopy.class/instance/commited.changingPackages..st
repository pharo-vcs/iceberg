events
commited: newCommit changingPackages: aCollection
	self halt.
	self repository addCommit: newCommit.

	aCollection do: [ :package | self versionLoaded: (newCommit versionFor: package) ].
	referenceCommits := { newCommit } asOrderedCollection.
	repository announcer announce: IceCommited new.
