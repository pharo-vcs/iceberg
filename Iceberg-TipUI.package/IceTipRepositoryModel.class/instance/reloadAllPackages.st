actions
reloadAllPackages
	<noCache>
	
	IceTipStandardUIAction new 
		message: 'Reloading all packages';
		onSuccessRepositoryModified: self entity;
		execute: [ 
			Iceberg announcer suspendAllWhile: [ 
				self entity packages
					select: #isLoaded
					thenDo: #reload ] ]