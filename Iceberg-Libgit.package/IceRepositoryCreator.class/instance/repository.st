accessing
repository

	^ repository ifNil: [ repository := IceLibgitRepository new ]