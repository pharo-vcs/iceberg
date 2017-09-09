private
skipComment: aStream
	"I assume I'm on top of the begining of a comment"
	aStream skip: 1.
	[ aStream atEnd not 
		and: [ aStream next ~= $" or: [ aStream peek = $" ] ] ]
	whileTrue.	