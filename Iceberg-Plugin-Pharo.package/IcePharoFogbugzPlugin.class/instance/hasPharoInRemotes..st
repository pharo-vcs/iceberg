testing
hasPharoInRemotes: aRepository
	^ aRepository remotes 
		anySatisfy: [ :aRemote | self pharoURLs includes: aRemote url ].