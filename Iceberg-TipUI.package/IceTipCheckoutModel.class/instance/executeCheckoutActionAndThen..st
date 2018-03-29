actions
executeCheckoutActionAndThen: aBlock 
	
	<noCache>
	IceTipStandardAction new 
		message: ('Checking out {1} from {2}' format: { self checkoutTargetName. self repositoryName });
		onSuccessRepositoryModified: self repository;
		onSuccess: aBlock;
		execute: [ self checkout ]