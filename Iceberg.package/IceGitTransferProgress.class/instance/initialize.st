accessing
initialize
	super initialize.
	
	job := IceExternalJob new
		title: 'Fetching Git objects...';
		yourself.
		
	self initializeBlock.