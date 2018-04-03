actions
executeCheckoutActionAndThen: aBlock 
	
	<noCache>
	IceTipStandardAction new 
		repository: self repository;
		message: ('Checking out {1} from {2}' format: { self targetName. self repositoryName });
		onSuccessRepositoryModified;
		onSuccess: aBlock;
		execute: [ self checkout ]