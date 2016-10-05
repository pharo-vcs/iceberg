actions - selected repository
showHistory
	^ GLMGenericAction new
		selectionAction: #browseHistory;
		selectionCondition: #isOperative;
		icon: GLMUIThemeExtraIcons glamorousBrowse;
		showTitle: 'Show history...';
		shortcut: $h
