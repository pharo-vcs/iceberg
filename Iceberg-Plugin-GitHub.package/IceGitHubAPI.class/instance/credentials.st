accessing
credentials
	^ credentials ifNil: [ credentials := self class obtainCredentials ]