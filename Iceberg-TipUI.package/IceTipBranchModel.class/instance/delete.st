actions
delete
	<noCache>
	
	IceTipStandardAction new
		repository: self repositoryModel entity;
		message: ('Removing branch {1}' format: { self name });
		onSuccessRepositoryModified;
		execute: [ self entity delete ]