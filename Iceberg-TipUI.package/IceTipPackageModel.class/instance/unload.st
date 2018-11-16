actions
unload
	<noCache>

	IceTipStandardAction new 
		repository: self entity repository;
		message: ('Unloading package {1}' format: { self entity name });
		onSuccessRepositoryModified; 
		execute: [ 
			Iceberg announcer
				suspendAllForRepository: self entity repository
				while: [ self entity unload ] ]