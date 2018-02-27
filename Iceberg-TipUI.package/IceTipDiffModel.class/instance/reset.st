accessing
reset
	self diff resetElements.
	UIManager default 	
		informUser: 'Refreshing changes' 
		during: [ self allElements ]