actions
installAction
	^ GLMGenericAction new
		action: [ :presentation | presentation selection install ];
		icon: (self iconNamed: #edit);
		title: 'Install'; 
		showTitle