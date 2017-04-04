initialization
initializeAnnouncer
	announcer 
		ifNil: [ announcer := Announcer new ]
		ifNotNil: [	announcer subscriptions reset ].
	announcer
		when: IceCommited, IcePackageLoaded 
		send: #refresh 
		to: self