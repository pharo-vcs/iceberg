building
addRepositoryRemotesTo: composite
	| remotes |
	
	(remotes := composite fastTable)
		title: 'Remotes';
		display: #remotes;
		column: 'Name' evaluated: [ :remote :model | remote descriptionText ] width: 80;
		column: 'URL' evaluated: #url width: 380;
		column: 'Status' evaluated: [ :remote :model | remote status ];
		updateOn: IceRemoteAdded from: #announcer.
		
	"actions"
	remotes addAction: self remoteAddAction.
	"selection actions"
	remotes 
		addSelectionAction: self remoteMakePullingAction;
		addSelectionAction: self remoteMakePushingAction;
		addSelectionAction: self remoteFetchAction;
		addSelectionAction: self remotePullAction;
		addSelectionAction: self remotePushAction;
		addSelectionAction: self remoteRemoveAction.
	"Plugin actions"
	remotes dynamicActionsOnSelection: [ :presentation | 
		presentation entity pluginRemoteActionsFor: presentation selection ]