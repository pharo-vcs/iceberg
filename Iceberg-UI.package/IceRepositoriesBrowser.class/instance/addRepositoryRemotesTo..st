building
addRepositoryRemotesTo: composite
	| remotes |
	
	(remotes := composite fastTable)
		title: 'Remotes';
		display: #remotes;
		column: 'Name' evaluated: #remoteName width: 80;
		column: 'URL' evaluated: #url;
		updateOn: IceRemoteAdded from: [ self ].
		
	"actions"
	remotes addAction: self remoteAdd.
	
	"selection actions"
	remotes 
		addSelectionAction: self remoteEdit;
		addSelectionAction: self remoteRemove.
 