actions
pushThen: aBlock
	IceTipStandardAction new 
		repository: self entity;
		message: ('Pushing to {1}' format: { self remote name }) ;
		onSuccessRepositoryModified;
		onSuccess: aBlock;
		execute: [ self entity pushTo: self remote ]