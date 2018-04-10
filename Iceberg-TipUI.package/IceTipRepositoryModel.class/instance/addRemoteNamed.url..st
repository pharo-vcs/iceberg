actions
addRemoteNamed: aName url: anUrl
	
	IceTipStandardAction new 
		repository: self entity;
		message: 'Adding remote';
		onSuccessRepositoryModified;
		execute: [ | remote |
			remote := IceGitRemote name: aName url: anUrl.
			self entity addRemote: remote.
			remote fetch ]