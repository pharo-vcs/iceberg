actions
delete
	<noCache>
	
	IceTipStandardUIAction new
		message: ('Removing branch {1}' format: { self name });
		onSuccessRepositoryModified: self repositoryModel entity;
		execute: [ self entity delete ]