menu actions - selected repository
fullSynchronizeRepositoryAction
	^ GLMGenericAction new
		selectionAction: #fullSynchronize;
		selectionCondition: #isOperative;
		icon: #glamorousBrowse asIcon;
		category: 'Advanced';
		title: 'Synchronize full repository...';
		showTitle;
		yourself