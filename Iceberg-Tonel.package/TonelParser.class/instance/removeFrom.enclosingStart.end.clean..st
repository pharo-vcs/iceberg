private
removeFrom: aString enclosingStart: startChar end: endChar clean: cleanSymbol
	"cleanSymbol can be #left, #rigth and #both" 
	| result stop ch start end |
	
	result := aString trimBoth readStream.
	(result peek = startChar) 
		ifFalse: [ TonelParseError signal: 'I cannot remove enclosing start' ].
	result skip: 1.
	
	(#(both left) includes: cleanSymbol) 
		ifTrue: [ 
			stop := false.
			[ stop not and: [ self isSeparator: (ch := result peek) ] ]
			whileTrue: [ 
				(self isEnter: ch) ifTrue: [ stop := true ].
				result skip: 1 ] ].
	start := result position.
	
	result setToEnd.
	result skip: -1.
	(result peek = endChar) 
		ifFalse: [ TonelParseError signal: 'I cannot remove enclosing end' ].
	result skip: -1.
	(#(both right) includes: cleanSymbol)
		ifTrue: [ 
			stop := false.
			[ stop not and: [ self isSeparator: (ch := result peek) ] ]
			whileTrue: [ 
				(self isEnter: ch) ifTrue: [ stop := true ].
				result skip: -1. ] ].
	end := result position.
	
	^ result originalContents
		copyFrom: start + 1 
		to: end + 1