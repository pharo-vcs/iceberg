conditions
resetOn: anAnnouncementClass condition: aBlock from: anAnnouncer
	resetConditions at: anAnnouncementClass put: aBlock.
	anAnnouncer weak
		when: anAnnouncementClass
		send: #doReset:
		to: self