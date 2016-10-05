actions - selected repository
switchBranch
	^ GLMGenericAction new
		selectionAction: #switchBranchUpdating:;
		selectionCondition: #isOperative;
		showTitle: 'Switch branch...';
		shortcut: $b.
