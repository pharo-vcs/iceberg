actions
switchAndMerge
	<noCache>

	IceTipStandardAction new 
		message: ('Merging branch {1} from {2}' format: { self name. self repositoryName });
		onSuccessRepositoryModified: self entity repository;
		execute: [ self entity switchAndMergeWorkingCopy ]