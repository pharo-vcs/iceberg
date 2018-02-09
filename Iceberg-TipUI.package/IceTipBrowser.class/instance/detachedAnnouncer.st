accessing
detachedAnnouncer
	detachedAnnouncer ifNil: [ detachedAnnouncer := WeakArray with: Announcer new ].
	^ detachedAnnouncer at: 1