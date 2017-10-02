private
removeFrom: aString enclosingStart: startChar end: endChar
	| result stop ch start end |
	
	result := aString trimBoth readStream.
	(result peek = startChar) 
		ifFalse: [ ShoalParseError signal: 'I cannot remove enclosing start' ].
	result skip: 1.
	
	stop := false.
	[ stop not and: [ self isSeparator: (ch := result peek) ] ]
	whileTrue: [ 
		(self isEnter: ch) ifTrue: [ stop := true ].
		result skip: 1 ].
	start := result position.
	
	result setToEnd.
	result skip: -1.
	(result peek = endChar) 
		ifFalse: [ ShoalParseError signal: 'I cannot remove enclosing end' ].
	result skip: -1.
	stop := false.
	[ stop not and: [ self isSeparator: (ch := result peek) ] ]
	whileTrue: [ 
		(self isEnter: ch) ifTrue: [ stop := true ].
		result skip: -1. ]. 
	end := result position.
	
	^ result originalContents
		copyFrom: start + 1 
		to: end + 1