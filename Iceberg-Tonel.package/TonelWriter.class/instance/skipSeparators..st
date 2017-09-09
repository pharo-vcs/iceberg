private
skipSeparators: aStream
	[ aStream peek isSeparator ]
	whileTrue: [ aStream skip: 1 ]. 
