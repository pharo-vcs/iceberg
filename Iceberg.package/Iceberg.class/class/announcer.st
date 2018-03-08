accessing
announcer
	^ icebergAnnouncer ifNil: [ icebergAnnouncer := GLMAnnouncer new ]