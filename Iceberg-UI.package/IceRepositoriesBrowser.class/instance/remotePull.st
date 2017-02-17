actions - remotes
remotePull
	^ GLMGenericAction new
		action: [ :presentation :model | 
			model pullRemote: presentation selection. 
			presentation pane browser update ];
		icon: #glamorousLeftSide asIcon;
		showTitle: 'Pull'; 
		yourself