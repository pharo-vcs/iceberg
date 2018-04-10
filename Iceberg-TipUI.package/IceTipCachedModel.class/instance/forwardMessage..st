reflective operations
forwardMessage: aMessage
	^ realObject 
		perform: aMessage selector 
		withArguments: aMessage arguments 