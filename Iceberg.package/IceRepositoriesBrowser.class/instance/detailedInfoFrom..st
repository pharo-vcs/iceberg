utilities
detailedInfoFrom: repository
	^ { 
		'Remote host' -> repository origin host.
		'Owner' -> repository origin owner.
		'Project name' -> repository origin projectName.
		'Location' -> repository location. 
	} 
