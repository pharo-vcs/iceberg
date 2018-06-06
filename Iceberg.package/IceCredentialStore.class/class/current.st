accessing
current
	^ CurrentStore ifNil: [ CurrentStore := self new ]