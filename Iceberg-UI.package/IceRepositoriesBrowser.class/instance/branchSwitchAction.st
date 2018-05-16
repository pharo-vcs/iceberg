menu actions - branches
branchSwitchAction
	^ GLMGenericAction new
		action: [ :presentation :model | 
			presentation selection switchToMe.
			presentation pane browser update ];
		showTitle: 'Switch to this branch';
		enabledCondition: [ :presentation :model | (model isCurrentBranch: presentation selection branch) not ];
		condition: [ :presentation | presentation selection ifNil: [ false ] ifNotNil:  #isBranchModel ];
		shortcut: $b;
		yourself