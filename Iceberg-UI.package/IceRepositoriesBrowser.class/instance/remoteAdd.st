menu actions - remotes
remoteAdd
	^ GLMGenericAction new
		action: [ :presentation :model | 
			model addRemoteThen: [ presentation pane browser update ] ];
		icon: #add asIcon;
		showTitle: 'Add remote'; 
		yourself
