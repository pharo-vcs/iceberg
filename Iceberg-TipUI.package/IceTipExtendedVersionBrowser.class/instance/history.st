accessing
history
	^ history ifNil: [ history := self retrieveHistory ]