actions
fetch
	<noCache>
	
	IceTipStandardAction new 
		repository: self entity;
		message: ('Fetching incoming commits of {1}' format: { self name });
		onSuccessRepositoryModified;
		execute: [ self entity fetch ]