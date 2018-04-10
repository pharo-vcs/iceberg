testing
isMatchingAnnouncementSuspended: anAnnouncement
	suspendedConditions ifEmpty: [ ^ false ].
	^ suspendedConditions anySatisfy: [ :each | each value: anAnnouncement ]