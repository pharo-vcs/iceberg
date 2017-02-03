initialization
initialize
	"NOTE: this was before [ self entity incomingCommits ], but this is not happy 
	 with weak announcements (they will remain forever)... so we change them for 
	 WeakMessageSend instances to avoid problems"
	incomingCommits := (IceCachedValue
		for: (WeakMessageSend receiver: self selector: #obtainIncomingCommits))
			invalidateOn: IceRepositoryAnnouncement 
			from: self repository announcer.
	
	outgoingCommits := (IceCachedValue
		for: (WeakMessageSend receiver: self selector: #obtainOutgoingCommits))
			invalidateOn: IceRepositoryAnnouncement 
			from: self repository announcer