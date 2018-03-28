actions
fetch
	<noCache>
	
	IceTipStandardAction new 
		message: ('Fetching incoming commits of {1}' format: { self name });
		onSuccessRepositoryModified: self entity;
		execute: [ self entity fetch ]