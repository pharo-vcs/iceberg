actions - remotes
remotePush
	^ GLMGenericAction new
		action: [ :presentation :model | 
			model pushRemote: presentation selection. 
			presentation pane browser update ];
		showTitle: 'Push'; 
		yourself