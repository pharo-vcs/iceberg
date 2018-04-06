initialization
subscribeToAnnouncements
	self announcer 
		when: IceTipDiffRefreshed 
		send: #refreshWhenRepository: 
		to: self