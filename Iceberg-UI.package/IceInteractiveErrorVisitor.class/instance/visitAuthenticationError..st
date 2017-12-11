visiting
visitAuthenticationError: anError
	self flag: #todo. "in fact, I still don't know how to handle authentication errors. 
	Most probably I need to breakdown them into smaller pieces."
	UIManager default 
		alert: (anError messageText ifEmpty: [ 'No description provided.' ])
		title: 'Iceberg authentication Error'