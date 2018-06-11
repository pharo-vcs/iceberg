actions
installAction
	^ GLMGenericAction new
		action: [ :presentation | presentation selection install ];
		icon: #edit asIcon;
		title: 'Install'; 
		showTitle