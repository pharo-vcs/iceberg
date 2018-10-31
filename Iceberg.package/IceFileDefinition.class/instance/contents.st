accessing
contents
	"Contents for display purposes.
	If the file is binary (or could not detect as utf8 file) then just return an hexa dump representation of the contents
	If the file is in utf8 decode it and show the text"

	^ self isBinary
		ifTrue: [ String streamContents: [ :stream | contents hexDumpOn: stream max: Float infinity ] ]
		ifFalse: [ contents utf8Decoded ]