actions - remotes
remoteMakePulling
	^ GLMGenericAction new
		action: [ :presentation :model | 
			model pullingRemote: presentation selection. 
			presentation pane browser update ];
		"icon: #add asIcon;"
		showTitle: 'Make default pulling remote'; 
		enabledCondition: [ :presentation :model | 
			(model isPullingRemote: presentation selection) not ];
		yourself
