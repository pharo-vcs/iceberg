actions
checkoutWithStrategy: aCheckoutStrategy then: aBlock
	<noCache>
	
	IceTipStandardAction new 
		repository: self entity repository; 
		message: ('Checking out branch {1} from {2}' format: { self name. self repositoryName });
		onSuccessRepositoryModified;
		onSuccess: aBlock;
		execute: [ self entity checkoutWithStrategy: aCheckoutStrategy ]