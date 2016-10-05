actions - selected repository
createNewBranch
	^ GLMGenericAction new
		selectionAction: #createNewBranch;
		selectionCondition: #isOperative;
		showTitle: 'Create new branch...';
		shortcut: $B.
