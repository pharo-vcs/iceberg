parsing
separator
	[ stream atEnd not and: [ self isSeparator: stream peek ] ]
	whileTrue: [ stream next ].
	^ nil