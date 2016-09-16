action creators
browseAction
	^ GLMGenericAction new
		action: [ :presentation | presentation selection browse ];
		condition: [ :presentation :entity | 
			presentation selection notNil 
				and: [ presentation selection canBeBrowsed ]];
		icon: (Smalltalk ui icons iconNamed: #nautilus);
		shortcut: $b;
		title: 'Browse'; 
		showTitle