actions
refreshTreeAction
	^ GLMGenericAction new
		action: [ :presentation :entity | entity refresh ];
		icon: #glamorousRefresh asIcon;
		shortcut: $r;
		title: 'Refresh tree'; showTitle