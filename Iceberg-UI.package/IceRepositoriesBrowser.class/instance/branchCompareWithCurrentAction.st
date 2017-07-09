menu actions - branches
branchCompareWithCurrentAction
	^ GLMGenericAction new
		action: [ :presentation :model | 
			presentation selection compareCurrentToMe.
			presentation pane browser update ];
		enabledCondition: [ :presentation :model | (model isCurrentBranch: presentation selection branch) not ];
		condition: [ :presentation | presentation selection ifNil: [ false ] ifNotNil: #isBranchModel ];
		showTitle: 'Compare with current branch';
		yourself