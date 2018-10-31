*Iceberg-Pharo6
hexDumpOn: aStream max: maxBytes
	"Print a hex dump of the receiver on the supplied stream, up to maxBytes long"

	| ch i string remainder |

	i := 0.
	[ :stream |
		ch := stream next.
		[ch notNil and: [ i < maxBytes ]] whileTrue: [ 
			remainder := i \\ 16.
			remainder = 0 ifTrue: [ 
				i = 0 ifFalse: [ aStream cr ].
				aStream 
					<< (i printPaddedWith: $0 to: 8 base: 16);
					<< '  '.
				string := String new writeStream ].
			aStream
				<< (ch printPaddedWith: $0 to: 2 base: 16);
				<< ' '.
			(ch between: 32 and: 126) ifTrue: 
				[ string nextPut: (Character value: ch) ]
			ifFalse:
				[ string nextPut: $. ].
			remainder = 15 ifTrue: [ 
				aStream
					<< '  |';
					<< string contents;
					<< '|' ].
			ch := stream next.
			i := i + 1 ].
		remainder := i \\ 16.
		(ch isNil and: [remainder between: 1 and: 15]) ifTrue: [ 
			(16 - remainder) timesRepeat: [ aStream nextPutAll: '   ' ].
			aStream
				<< '  |';
				<< string contents.
			(16 - remainder timesRepeat: [ aStream nextPut: Character space ]).
			aStream
				<< '|' ].
		aStream cr.
		self size > maxBytes ifTrue: 
			[ aStream nextPutAll: '  ... truncated ...'; cr ] ] value: self readStream.
