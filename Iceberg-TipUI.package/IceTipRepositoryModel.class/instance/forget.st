actions
forget
	<noCache>
	
	IceTipStandardAction new
		repository: self entity;
		message: ('Forgeting {1}' format: {self name});
		execute: [ self entity forget ]