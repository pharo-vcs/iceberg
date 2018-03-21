actions
merge
	<noCache>

	IceTipStandardUIAction new 
		message: ('Merging branch {1} from {2}' format: { self name. self repositoryName });
		onSuccessRepositoryModified: self entity repository;
		execute: [ self entity merge ]