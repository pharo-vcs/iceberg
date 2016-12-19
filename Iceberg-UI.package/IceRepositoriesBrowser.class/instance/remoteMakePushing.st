actions - remotes
remoteMakePushing
	^ GLMGenericAction new
		action: [ :presentation :model | 
			model pushRemote: presentation selection. 
			presentation pane browser update ];
		"icon: #add asIcon;"
		showTitle: 'Make default pushing remote'; 
		enabledCondition: [ :presentation :model | 
			(model isPushRemote: presentation selection) not ];
		yourself
