accessing
announcer
	^ icebergAnnouncer ifNil: [ icebergAnnouncer := IceAnnouncer new ]