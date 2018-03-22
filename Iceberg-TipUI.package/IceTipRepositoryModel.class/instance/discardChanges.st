actions
discardChanges
	<noCache>
	
	IceTipStandardAction new 
		message: 'Discarding changes';
		onSuccessRepositoryModified: self entity;
		execute: [ 
			Iceberg announcer suspendAllWhile: [ 
				self entity discardChanges ] ]