parsing
metadata
	| result ch count |
	
	result := String new writeStream.

	count := 0.
	stream peek = ${ ifFalse: [ TonelParseError signal: 'Can''t parse metadata' ].	
	[ stream atEnd not ]
	whileTrue: [ 
		ch := stream next.
		result nextPut: ch.
		ch = ${ ifTrue: [ count := count +1 ].
		ch = $} ifTrue: [ count := count -1 ].
		count = 0 ifTrue: [ ^ STON fromString: result contents ]].

	TonelParseError signal: 'Can''t parse metadata'