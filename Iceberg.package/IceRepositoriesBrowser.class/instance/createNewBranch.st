actions - selected repository
createNewBranch
	^ GLMGenericAction new
		selectionAction: #createNewBranchUpdating:;
		selectionCondition: #isOperative;
		showTitle: 'Create new branch...';
		shortcut: $B.
