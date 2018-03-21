actions
delete
	<noCache>
	
	IceTipUIAction new
		message: ('Removing branch {1}' format: { self name });
		onSuccessAnnounce: [ IceRepositoryModified for: self repositoryModel entity ];
		do: [ self entity delete ]