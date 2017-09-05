parsing
comment
	| result ch eatNext |
	
	result := String new writeStream.

	eatNext := false.
	stream next = $" ifFalse: [ ShoalParseError signal: 'Can''t parse comment' ].	
	[ stream atEnd not 
		and: [ 
				(ch := stream next) ~= $" 
				or: [ eatNext := (stream peek = $") ] ] ]
	whileTrue: [ 
		result nextPut: ch.
		eatNext ifTrue: [ 
			stream skip: 1.
			eatNext := false ] ].

	^ result contents trimBoth