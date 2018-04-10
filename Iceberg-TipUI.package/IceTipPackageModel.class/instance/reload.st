actions
reload
	<noCache>

	IceTipStandardAction new 
		repository: self entity repository;
		message: ('Reloading package {1}' format: { self entity name }) ;
		onSuccessRepositoryModified;
		execute: [ 
			Iceberg announcer 
				suspendAllForRepository: self entity repository 
				while: [ self entity reload ] ]