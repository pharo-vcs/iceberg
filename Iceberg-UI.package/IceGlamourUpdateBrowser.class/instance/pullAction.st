action creators
pullAction
	^ GLMGenericAction new
		action: [ :presentation :repository | 
			repository pullFrom: repository pullRemote.
			presentation update ];
		icon: GLMUIThemeExtraIcons glamorousLeftSide;
		shortcut: $p;
		title: 'Pull'; 
		showTitle
