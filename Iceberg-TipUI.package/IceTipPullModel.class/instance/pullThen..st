actions
pullThen: aBlock
	IceTipStandardAction new 
		message: ('Pulling from {1}' format: { self remote name });
		onSuccessRepositoryModified: self entity;
		onSuccess: aBlock;
		execute: [ self entity pullFrom: self remote ]