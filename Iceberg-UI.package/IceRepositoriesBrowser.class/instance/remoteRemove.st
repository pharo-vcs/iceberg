actions - remote
remoteRemove
	^ GLMGenericAction new
		action: [ :presentation :model | model removeRemote: presentation selection ];
		icon: #remove asIcon;
		showTitle: 'Remove'; 
		yourself
