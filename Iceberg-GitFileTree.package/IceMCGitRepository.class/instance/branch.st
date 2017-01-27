accessing
branch
	^ currentHead ifNil: [ currentHead := self lookupHead ]