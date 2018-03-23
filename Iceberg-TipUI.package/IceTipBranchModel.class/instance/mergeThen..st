actions
mergeThen: aBlock
	<noCache>

	IceTipStandardAction new 
		message: ('Merging branch {1} from {2}' format: { self name. self repositoryName });
		onSuccessRepositoryModified: self entity repository;
		onSuccess: aBlock;
		execute: [ self entity merge ]