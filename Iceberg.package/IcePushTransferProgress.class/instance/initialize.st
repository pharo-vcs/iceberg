accessing
initialize
	super initialize.
	
	job := IceExternalJob new
		title: self title;
		yourself.
		
	self initializeBlock.