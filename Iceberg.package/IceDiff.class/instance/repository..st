accessing
repository: anObject
	repository := anObject.
	repository announcer weak
		when: IceCommited send: #refresh to: self