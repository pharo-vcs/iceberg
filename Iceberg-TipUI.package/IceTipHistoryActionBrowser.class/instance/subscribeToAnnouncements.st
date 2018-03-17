initialization
subscribeToAnnouncements
	self announcer 
		when: IceRepositoryModified, IceTipDiffRefreshed 
		send: #refreshWhenRepository: 
		to: self	