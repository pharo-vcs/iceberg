menu actions - remotes
remoteMakePushing
	^ GLMGenericAction new
		action: [ :presentation :model | 
			model makePushRemote: presentation selection. 
			presentation pane browser update ];
		"icon: #add asIcon;"
		showTitle: 'Make default push remote'; 
		enabledCondition: [ :presentation :model | 
			(model isPushRemote: presentation selection) not ];
		yourself
