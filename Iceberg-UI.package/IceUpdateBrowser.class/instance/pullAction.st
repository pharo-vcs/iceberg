action creators
pullAction
	^ GLMGenericAction new
		action: [ :presentation :repository | 
			self pull: repository then: [ presentation update ] ];
		icon: #glamorousLeftSide asIcon;
		shortcut: $p;
		title: 'Pull'; 
		showTitle
