actions
refreshTreeAction
	^ GLMGenericAction new
		action: [ :presentation |
			self entity rebuild.
			presentation update ];
		icon: #glamorousRefresh asIcon;
		shortcut: $r;
		title: 'Refresh tree'; showTitle