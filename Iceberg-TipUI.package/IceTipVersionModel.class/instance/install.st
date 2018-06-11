actions
install
	<noCache>

	IceTipStandardAction new 
		repository: self repositoryModel entity; 
		message: ('Installing {1} - {2}' format: { self entity definition. self name });
		onSuccessRepositoryModified;
		execute: [ self basicInstall ]