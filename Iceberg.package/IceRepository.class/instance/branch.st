accessing
branch
	^ branch ifNil: [ branch := self backend lookupHead ]