actions
refreshTreeAction
	^ GLMGenericAction new
		action: [ :presentation |
			self entity rebuild.
			presentation update ];
		icon: (self iconNamed: #glamorousRefresh);
		shortcut: $r;
		title: 'Refresh tree'; showTitle