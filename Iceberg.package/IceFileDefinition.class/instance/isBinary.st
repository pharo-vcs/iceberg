testing
isBinary
	
	[contents utf8Decoded] on: ZnInvalidUTF8 do: [ ^ true ].
	^ false