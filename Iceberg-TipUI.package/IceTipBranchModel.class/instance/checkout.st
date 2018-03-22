actions
checkout
	<noCache>
	
	IceTipStandardAction new 
		message: ('Checking out branch {1} from {2}' format: { self name. self repositoryName });
		onSuccessRepositoryModified: self entity repository;
		execute: [ self entity checkout ]