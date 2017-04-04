accessing
repository: anObject
	repository := anObject.
	repository announcer 
		subscribe: IceCommited send: #refresh to: self