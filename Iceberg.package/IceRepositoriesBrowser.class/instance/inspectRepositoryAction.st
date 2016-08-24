action creators
inspectRepositoryAction
	^ GLMGenericAction new
		action: [ :presentation | presentation selection inspect ];
		shortcut: $i;
		title: 'Inspect'; 
		showTitle