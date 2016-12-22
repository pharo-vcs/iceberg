building
addRepositoryRemotesTo: composite
	| remotes |
	
	(remotes := composite fastTable)
		title: 'Remotes';
		display: #remotes;
		column: 'Name' evaluated: #remoteName width: 80;
		column: 'URL' evaluated: #url width: 380;
		column: 'Status' evaluated: [ :remote :model | model statusForRemote: remote ];
		updateOn: IceRemoteAdded from: #announcer.
		
	"actions"
	remotes addAction: self remoteAdd.
	
	"selection actions"
	remotes 
		addSelectionAction: self remoteMakePulling;
		addSelectionAction: self remoteMakePushing;
		addSelectionAction: self remoteRemove.
 