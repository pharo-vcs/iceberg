actions
executeMergeActionAndThen: aBlock 

	<noCache>
	IceTipStandardAction new 
		message: ('Merging {1} into {2}' format: { self targetName. self repositoryName });
		onSuccessRepositoryModified: self repository;
		onSuccess: aBlock;
		execute: [ self merge ]