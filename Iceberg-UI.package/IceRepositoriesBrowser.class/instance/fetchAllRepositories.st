actions - repositories list
fetchAllRepositories
	^ GLMGenericAction new 
		action: [ self doFetchAllRepositories ];
		icon: #glamorousLeftSide asIcon;
		shortcut: $F;
		showTitle: 'Fetch all'
		