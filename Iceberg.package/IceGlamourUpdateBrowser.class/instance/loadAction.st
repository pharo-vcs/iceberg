action creators
loadAction
	^ GLMGenericAction new
		action: [ :presentation | presentation selection load. presentation selection: nil ];
		icon: (Smalltalk ui icons iconNamed: #changeBlock);
		shortcut: $l;
		title: 'Load (detached)'; showTitle