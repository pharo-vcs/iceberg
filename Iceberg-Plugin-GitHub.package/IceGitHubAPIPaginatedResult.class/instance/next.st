accessing
next 
	nextPage ifNil: [ nextPage := 1 ].
	[ result := self api getRaw: (self request asUrl ? (#page -> nextPage asString)) asString ]
	ensure: [ nextPage := nextPage + 1].
	^ STON fromString: result contents