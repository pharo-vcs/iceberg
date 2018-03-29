actions
reload
	<noCache>

	IceTipStandardAction new 
		repository: self entity repository;
		message: ('Reloading package {1}' format: { self entity name }) ;
		onSuccessRepositoryModified;
		execute: [ 
			Iceberg announcer 
				suspendAllWhile: [ self entity reload ] ]
