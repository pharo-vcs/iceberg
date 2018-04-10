actions
load
	<noCache>

	IceTipStandardAction new 
		repository: self entity repository;
		message: ('Loading package {1}' format: { self entity name });
		onSuccessRepositoryModified;
		execute: [ 
			Iceberg announcer
				suspendAllForRepository: self entity repository
				while: [ self entity load ] ]