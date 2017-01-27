actions - selected repository
synchronizeRepository
	^ GLMGenericAction new
		selectionAction: #synchronize;
		selectionCondition: #isOperative;
		icon: #glamorousBrowse asIcon;
		shortcut: $s;
		title: 'Synchronize repository...'; showTitle