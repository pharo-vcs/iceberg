action creators
refreshTreeAction
	^ GLMGenericAction new
		action: [ :presentation :entity | entity refresh ];
		icon: GLMUIThemeExtraIcons glamorousRefresh;
		shortcut: $r;
		title: 'Refresh tree'; showTitle