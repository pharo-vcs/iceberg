actions - remote
remoteEdit
	^ GLMGenericAction new
		action: [ :presentation :model | model editRemote: presentation selection ];
		icon: #edit asIcon;
		showTitle: 'Edit'; 
		yourself
