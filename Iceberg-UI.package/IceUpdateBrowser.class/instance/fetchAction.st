action creators
fetchAction
	^ GLMGenericAction new
		action: [ :presentation :repository | 
			self 
				fetch: repository 
				then: [ presentation update ] ];
		icon: #glamorousLeftSide asIcon;
		shortcut: $f;
		title: 'Fetch new versions'; 
		showTitle
