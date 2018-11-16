actions
mergeThen: aBlock
	<noCache>

	IceTipStandardAction new 
		repository: self repositoryModel entity;
		message: ('Merging branch {1} from {2}' format: { self name. self repositoryName });
		onSuccessRepositoryModified;
		onSuccess: aBlock;
		execute: [ self entity merge ]