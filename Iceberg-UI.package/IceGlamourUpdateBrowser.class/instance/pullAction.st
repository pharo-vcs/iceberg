action creators
pullAction
	^ GLMGenericAction new
		action: [ :presentation :repository | 
			repository pull.
			presentation update ];
		icon: #glamorousLeftSide asIcon;
		shortcut: $p;
		title: 'Pull'; 
		showTitle
