accessing
repository
	repository ifNil: [ repository := self searchExistingRepository ].
	repository ifNil: [ repository := self createRepository ].
	^ repository