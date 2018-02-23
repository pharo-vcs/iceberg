actions
repository: anObject
	super repository: anObject.
	anObject announcer weak
		when: IceCommited send: #refresh to: self