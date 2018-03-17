initialization
subscribeToAnnouncements
	self announcer 
		when: IceTipDiffRefreshed 
		send: #refreshWhenRepository: 
		to: self.
		
	Iceberg announcer weak 
		when: IceRepositoryAnnouncement 
		send: #refreshWhenRepository: 
		to: self