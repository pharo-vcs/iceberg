actions - selected repository
showHistory
	^ GLMGenericAction new
		selectionAction: #browseHistory;
		selectionCondition: #isOperative;
		icon: #glamorousBrowse asIcon;
		showTitle: 'Show history...';
		shortcut: $h
