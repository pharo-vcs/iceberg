initialization
initialize
	super initialize.
	
	job := IceExternalJob new
		title: 'Checking out...';
		yourself.
		
	self initializeBlock.