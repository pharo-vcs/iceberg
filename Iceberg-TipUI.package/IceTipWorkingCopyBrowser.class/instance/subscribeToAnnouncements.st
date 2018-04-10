initialization
subscribeToAnnouncements
	Iceberg announcer weak 
		when: IceRepositoryAnnouncement 
		send: #refreshWhenRepository: 
		to: self
