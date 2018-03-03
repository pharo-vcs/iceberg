actions
load
	UIManager default
		informUser: ('Loading package {1}' format: { self name }) 
		during: [ self entity load ].