accessing
repository: anObject
	repository := anObject.
	repository announcer weak subscribe: IceCommited do: [ self refresh ].