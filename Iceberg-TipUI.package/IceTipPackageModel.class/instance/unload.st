actions
unload
	<noCache>

	IceTipStandardAction new 
		message: ('Unloading package {1}' format: { self entity name });
		onSuccessRepositoryModified: self entity repository; 
		execute: [ self entity unload ]