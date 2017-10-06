menu actions - selected repository
fullSynchronizeRepositoryAction
	^ GLMGenericAction new
		selectionAction: #fullSynchronize;
		selectionCondition: #isOperative;
		icon: #glamorousBrowse asIcon;
		title: 'Synchronize full repository...'; showTitle