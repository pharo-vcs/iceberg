private
nextSourceOf: log
	^ (self nextLogOf: log)
		ifNotNil: #source
		ifNil: [ '' ]