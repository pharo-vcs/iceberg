initialization
initializeAnnouncer
	announcer 
		ifNil: [ announcer := Announcer new ]
		ifNotNil: [	announcer subscriptions reset ].
	announcer when: IcePackageLoaded do: [ self refresh ].
	announcer when: IceCommited do: [ self refresh ].
