actions
addPackages: aCollection
	IceTipStandardAction new 
		message: 'Adding packages';
		onSuccessRepositoryModified: self entity;
		execute: [ 
			aCollection do: [ :each | 
				self entity workingCopy addPackageNamed: each name ] ]