accessing
actionWidth
	^ actionWidth ifNil: [ self class defaultActionWidth ]