action creators
mergeAction
	^ GLMGenericAction new
		action: [ :presentation | presentation selection load. presentation selection: nil ];
		icon: GLMUIThemeExtraIcons glamorousLeftSide;
		shortcut: $m;
		title: 'Merge'; showTitle