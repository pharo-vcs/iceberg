actions
delete
	<noCache>
	
	IceTipStandardAction new
		repository: self repositoryModel entity;
		message: ('Removing tag {1}' format: { self name });
		onSuccessRepositoryModified;
		do: [ self repositoryModel entity removeTag: self entity ]