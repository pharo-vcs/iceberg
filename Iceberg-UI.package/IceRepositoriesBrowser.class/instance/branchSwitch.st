menu actions - branches
branchSwitch
	^ GLMGenericAction new
		action: [ :presentation :model | 
			model switchBranchTo: presentation selection. 
			presentation pane browser update ];
		"icon: #add asIcon;"
		showTitle: 'Switch to this branch'; 
		enabledCondition: [ :presentation :model | 
			(model isCurrentBranch: presentation selection) not ];
		shortcut: $b;
		yourself
