actions
unload
	<noCache>

	IceTipStandardAction new 
		repository: self entity repository;
		message: ('Unloading package {1}' format: { self entity name });
		onSuccessRepositoryModified; 
		execute: [ self entity unload ]