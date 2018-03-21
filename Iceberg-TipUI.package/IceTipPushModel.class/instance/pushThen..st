actions
pushThen: aBlock
	IceTipStandardUIAction new 
		message: ('Pushing to {1}' format: { self remote name }) ;
		onSuccessRepositoryModified: self entity;
		onSuccess: aBlock;
		execute: [ self entity pushTo: self remote ]