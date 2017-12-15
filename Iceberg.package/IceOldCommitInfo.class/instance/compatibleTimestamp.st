accessing
compatibleTimestamp
	"I'm a timestamp as system: likes authorname MM/DD/YYYY HH:MM"
	^ String streamContents: [ :stream |
		stream 
			<< self compatibleUsername 
			<< ' '
		 	<< self datetime asStringYMDHM  ]