actions
load
	<noCache>

	IceTipStandardUIAction new 
		message: ('Loading package {1}' format: { self entity name });
		onSuccessRepositoryModified: self entity repository;
		execute: [ self entity load ]