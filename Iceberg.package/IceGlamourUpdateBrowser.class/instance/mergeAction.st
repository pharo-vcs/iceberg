action creators
mergeAction
	^ GLMGenericAction new
		action: [ :presentation | 
			presentation selection merge. 
			presentation selection: nil ];
		icon: GLMUIThemeExtraIcons glamorousLeftSide;
		shortcut: $m;
		title: 'Merge'; showTitle