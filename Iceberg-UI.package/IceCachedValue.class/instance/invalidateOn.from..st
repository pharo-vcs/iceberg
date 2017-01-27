initialization
invalidateOn: announcementType from: announcer
	announcer weak subscribe: announcementType send: #reset to: self