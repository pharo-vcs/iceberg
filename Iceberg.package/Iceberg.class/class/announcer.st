accessing
announcer
	^ icebergAnnouncer ifNil: [ icebergAnnouncer := Announcer new ]