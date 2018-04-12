events
repositoryWillBeCreated: aRepository
	
	UIManager default 
		informUser: 'Fetching incomming commits'
		during: [ aRepository fetch ]