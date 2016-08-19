action creators
mergeAction
	^ GLMGenericAction new
		action: [ :presentation |
			presentation selection merge.
			presentation selection: nil.
			presentation pane browser update. ];
		icon: GLMUIThemeExtraIcons glamorousLeftSide;
		shortcut: $m;
		title: 'Merge'; showTitle