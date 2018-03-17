actions
reset
	UIManager default 	
		informUser: 'Refreshing changes' 
		during: [ 
			self resetDiff.
			"ask for diff to force a build"
			self diff ]