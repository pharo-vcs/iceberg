actions - package
browsePackage
	^ GLMGenericAction new
		selectionAction: #browse;
		selectionCondition: #isLoaded;
		showTitle: 'Browse package';
		shortcut: $b;
		yourself
