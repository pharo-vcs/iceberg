actions
reload
	<noCache>

	IceTipStandardUIAction new 
		message: ('Reloading package {1}' format: { self entity name }) ;
		onSuccessRepositoryModified: self entity repository;
		execute: [ 
			Iceberg announcer 
				suspendAllWhile: [ self entity reload ] ]
