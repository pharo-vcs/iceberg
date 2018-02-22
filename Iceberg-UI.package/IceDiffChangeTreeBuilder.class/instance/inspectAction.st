actions
"actions"
inspectAction
	^ GLMGenericAction new
		action: [ :presentation | presentation selection inspect ];
		icon: #smallInspectIt asIcon;
		shortcut: $i;
		title: 'Inspect'; 
		showTitle