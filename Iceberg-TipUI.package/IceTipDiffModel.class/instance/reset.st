accessing
reset
	UIManager default 	
		informUser: 'Refreshing changes' 
		during: [ 
			self resetDiff.
			self diff build ]