initialization
subscribeToAnnouncements
	Iceberg announcer weak 
		when: IceAnnouncement send: #refresh to: self.
