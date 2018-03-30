actions
executeMergeActionAndThen: aBlock 

	<noCache>
	IceTipStandardAction new 
		repository: self repository;
		message: ('Merging {1} into {2}' format: { self targetName. self repositoryName });
		onSuccessRepositoryModified;
		onSuccess: aBlock;
		execute: [ self merge ]