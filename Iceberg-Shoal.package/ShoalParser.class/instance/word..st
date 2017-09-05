private parsing
word: aString
	| result |
	result := stream next: aString size.
	result = aString
		ifFalse: [ ShoalParseError signal: 'Can''t parse ', aString ].
	^ result