action creators
fetchAction
	^ GLMGenericAction new
		action: [ :presentation :repository | 
			repository fetch.
			presentation update ];
		icon: #glamorousLeftSide asIcon;
		shortcut: $f;
		title: 'Fetch new versions'; 
		showTitle
