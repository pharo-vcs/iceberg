execution
execute
	item ifNil: [ ^ self ].
	IceTipStandardAction new
		repository: item entity;
		message: 'Recalculating Dirty Packages';
		onSuccessRepositoryModified;
		execute: [ item entity workingCopy forceCalculateDirtyPackages ]