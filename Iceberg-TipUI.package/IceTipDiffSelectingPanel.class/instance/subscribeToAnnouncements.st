initialize
subscribeToAnnouncements
	self announcer
		when: IceTipDiffEntryRemoved 
		send: #entryRemoved:
		to: self	