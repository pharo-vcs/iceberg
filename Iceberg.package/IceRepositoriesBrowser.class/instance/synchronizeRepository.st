actions - selected repository
synchronizeRepository
	^ GLMGenericAction new
		selectionAction: #synchronize;
		selectionCondition: #isOperative;
		icon: GLMUIThemeExtraIcons glamorousBrowse;
		shortcut: $s;
		title: 'Synchronize repository...'; showTitle