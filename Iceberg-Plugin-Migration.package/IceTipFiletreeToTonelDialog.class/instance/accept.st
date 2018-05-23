actions
accept
	
	IceTipStandardAction new 
		repository: self repository; 
		message: ('Migrating {1} sources to tonel' format: { self repository name });
		onSuccess: [ UIManager default inform: 'Sources migrated!' ];
		execute: [ self doAccept ]