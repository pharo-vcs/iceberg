actions
discardChanges
	<noCache>
	
	IceTipStandardAction new 
		repository: self entity;
		message: 'Discarding changes';
		onSuccessRepositoryModified;
		execute: [ 
			Iceberg announcer suspendAllWhile: [ 
				self entity discardChanges ] ]