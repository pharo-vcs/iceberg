actions
pullThen: aBlock
	IceTipStandardAction new 
		repository: self entity;
		message: ('Pulling from {1}' format: { self remote name });
		onSuccessRepositoryModified;
		onSuccess: aBlock;
		execute: [ self entity pullFrom: self remote ]