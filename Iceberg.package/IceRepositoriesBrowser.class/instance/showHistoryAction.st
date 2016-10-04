action creators
showHistoryAction
	^ GLMGenericAction new
		action: [ :table | IceHistoryBrowser openOn: table selection repository ];
		icon: GLMUIThemeExtraIcons glamorousBrowse;
		shortcut: $h;
		title: 'Show history...'; showTitle