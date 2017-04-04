menu actions - selected repository
switchBranchAction
	^ GLMGenericAction new
		selectionAction: #switchBranch;
		selectionCondition: #isOperative;
		showTitle: 'Switch branch...';
		shortcut: $b.