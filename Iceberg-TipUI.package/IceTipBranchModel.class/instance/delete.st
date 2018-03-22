actions
delete
	<noCache>
	
	IceTipStandardAction new
		message: ('Removing branch {1}' format: { self name });
		onSuccessRepositoryModified: self repositoryModel entity;
		execute: [ self entity delete ]