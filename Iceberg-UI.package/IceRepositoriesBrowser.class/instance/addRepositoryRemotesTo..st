building
addRepositoryRemotesTo: composite
	| remotes |
	
	(remotes := composite fastTable)
		title: 'Remotes';
		display: #remotes;
		column: 'Name' evaluated: #remoteName width: 80;
		column: 'URL' evaluated: #url tags: [ :remote :model | model tagsForRemote: remote ];
		updateOn: IceRemoteAdded from: [ self announcer ].
		
	"actions"
	remotes addAction: self remoteAdd.
	
	"selection actions"
	remotes 
		addSelectionAction: self remoteMakePulling;
		addSelectionAction: self remoteMakePushing;
		addSelectionAction: self remoteRemove.
 