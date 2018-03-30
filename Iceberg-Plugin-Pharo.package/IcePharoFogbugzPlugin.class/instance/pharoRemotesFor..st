testing
pharoRemotesFor: aRepository
	^ aRepository remotes 
		select: [ :aRemote | self pharoURLs includes: aRemote url ].