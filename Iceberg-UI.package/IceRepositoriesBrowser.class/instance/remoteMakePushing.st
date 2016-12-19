actions - remotes
remoteMakePushing
	^ GLMGenericAction new
		action: [ :presentation :model | 
			model pushingRemote: presentation selection. 
			presentation pane browser update ];
		"icon: #add asIcon;"
		showTitle: 'Make default pushing remote'; 
		enabledCondition: [ :presentation :model | 
			(model isPushingRemote: presentation selection) not ];
		yourself
