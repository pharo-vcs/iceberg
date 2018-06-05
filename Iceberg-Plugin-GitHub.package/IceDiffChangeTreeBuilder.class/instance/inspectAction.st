actions
inspectAction
	^ GLMGenericAction new
		action: [ :presentation | presentation selection inspect ];
		icon: (self iconNamed: #smallInspectIt);
		shortcut: $i;
		title: 'Inspect'; 
		showTitle