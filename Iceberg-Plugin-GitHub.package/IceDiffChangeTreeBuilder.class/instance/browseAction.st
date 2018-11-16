actions
browseAction
	^ GLMGenericAction new
		action: [ :presentation | presentation selection browse ];
		condition: [ :presentation :ent | 
			presentation selection notNil 
				and: [ presentation selection canBeBrowsed ]];
		icon: (self iconNamed: #nautilus);
		shortcut: $b;
		title: 'Browse'; 
		showTitle