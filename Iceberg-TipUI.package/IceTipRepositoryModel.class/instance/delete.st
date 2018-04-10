actions
delete
	<noCache>
	
	IceTipStandardAction new
		repository: self entity;
		message: ('Deleting {1}' format: {self name});
		execute: [ self entity delete ]