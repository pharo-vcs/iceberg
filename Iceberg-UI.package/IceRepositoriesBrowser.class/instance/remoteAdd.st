actions - remote
remoteAdd
	^ GLMGenericAction new
		action: [ :presentation :model | model addRemote ];
		icon: #add asIcon;
		showTitle: 'Add remote'; 
		yourself
