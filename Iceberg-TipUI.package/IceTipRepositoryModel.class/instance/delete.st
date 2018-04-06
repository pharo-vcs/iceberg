operations
delete
	<noCache>
	IceTipStandardAction new
		repository: self entity;
		message: ('Deleting {1}' format: {self name});
		onSuccessRepositoryModified;
		execute: [ self entity delete ]