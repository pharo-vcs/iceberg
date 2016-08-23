building
commitAction
	^ GLMGenericAction new
		action: [ :presentation :entity | self commit: entity withMessage: presentation text asString ];
		icon: GLMUIThemeExtraIcons glamorousSave;
		shortcut: $s;
		title: 'Commit'; 
		showTitle