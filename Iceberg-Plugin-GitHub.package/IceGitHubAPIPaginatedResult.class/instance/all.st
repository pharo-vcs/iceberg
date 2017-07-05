accessing
all
	| stream |
	stream := Array new writeStream.
	[ self hasNext ] 
	whileTrue: [ stream << self next ].
	^ stream contents