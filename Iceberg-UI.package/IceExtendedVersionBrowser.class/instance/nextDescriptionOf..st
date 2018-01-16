private
nextDescriptionOf: log
	^ (self nextLogOf: log)
		ifNotNil: #description
		ifNil: [ 'origin' ]