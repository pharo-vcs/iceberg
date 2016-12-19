actions - remotes
remoteMakePulling
	^ GLMGenericAction new
		action: [ :presentation :model | 
			model pullRemote: presentation selection. 
			presentation pane browser update ];
		"icon: #add asIcon;"
		showTitle: 'Make default pulling remote'; 
		enabledCondition: [ :presentation :model | 
			(model isPullRemote: presentation selection) not ];
		yourself
