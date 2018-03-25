actions
delete
	<noCache>
	
	IceTipStandardAction new
		message: ('Removing remote {1}' format: { self name });
		onSuccessRepositoryModified: self repositoryModel entity;
		do: [ self repositoryModel entity removeRemote: self entity ]