private
installBaseline: icePackage groups: anArray
	IceTipStandardAction new
		repository: self repositoryModel entity;
		message: ('Installing baseline {1} of {2}' format: { 
			icePackage name allButFirst: self class baselinePrefix size. 
			self repositoryModel name });
		onSuccessRepositoryModified;
		execute: [ 
			Iceberg announcer 
				suspendAllForRepository: self repositoryModel entity
				while: [ self basicInstallBaseline: icePackage groups: anArray ] ]