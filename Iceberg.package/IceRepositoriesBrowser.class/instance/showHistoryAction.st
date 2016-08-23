action creators
showHistoryAction
	^ GLMGenericAction new
		action: [ :table | IceHistoryBrowser openOn: table selection ];
		icon: GLMUIThemeExtraIcons glamorousBrowse;
		shortcut: $h;
		title: 'Show history...'; showTitle