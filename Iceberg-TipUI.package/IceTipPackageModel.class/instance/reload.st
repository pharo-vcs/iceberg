actions
reload
	UIManager default
		informUser: ('Reloading package {1}' format: { self name }) 
		during: [ self entity reload ]