action creators
browseAction
	^ GLMGenericAction new
		action: [ :presentation | presentation selection browse ];
		icon: (Smalltalk ui icons iconNamed: #nautilus);
		title: 'Browse'; 
		showTitle