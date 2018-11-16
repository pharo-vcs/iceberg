testing
isAnnouncementSuspended: anAnnouncement
	^ (super isAnnouncementSuspended: anAnnouncement) 
		or: [ self isMatchingAnnouncementSuspended: anAnnouncement ]