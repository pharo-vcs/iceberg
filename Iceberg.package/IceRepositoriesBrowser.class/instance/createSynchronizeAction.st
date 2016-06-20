building
createSynchronizeAction
	^ GLMGenericAction new
		action: [ :table | IceGlamourSynchronizer synchronize: table selection ];
		icon: GLMUIThemeExtraIcons glamorousBrowse;
		shortcut: $s;
		title: 'Synchronize with repository'; showTitle