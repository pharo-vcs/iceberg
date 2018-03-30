actions
addPackages: aCollection

	IceTipStandardAction new 
		repository: self entity;
		message: 'Adding packages';
		onSuccessRepositoryModified;
		execute: [ 
			aCollection do: [ :each | 
				self entity workingCopy addPackageNamed: each name ] ]