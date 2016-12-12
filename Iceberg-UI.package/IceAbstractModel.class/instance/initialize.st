initialization
initialize
	incomingCommits := (IceCachedValue for: [ self entity incomingCommits ])
		invalidateOn: IceRepositoryAnnouncement from: self repository announcer.
		
	outgoingCommits := (IceCachedValue for: [ self entity outgoingCommits ])
		invalidateOn: IceRepositoryAnnouncement from: self repository announcer.
	