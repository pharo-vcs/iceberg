private
nextDescriptionOf: log
	^ (self nextLogOf: log)
		ifNotNil: #description
		ifNil: [ 'begining' ]