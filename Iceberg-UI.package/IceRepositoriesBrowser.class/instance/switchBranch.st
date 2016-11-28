actions - selected repository
switchBranch
	^ GLMGenericAction new
		selectionAction: #switchBranch;
		selectionCondition: #isOperative;
		showTitle: 'Switch branch...';
		shortcut: $b.
