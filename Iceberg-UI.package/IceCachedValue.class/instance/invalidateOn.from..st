initialization
invalidateOn: announcementType from: announcer
	announcer when: announcementType send: #reset to: self