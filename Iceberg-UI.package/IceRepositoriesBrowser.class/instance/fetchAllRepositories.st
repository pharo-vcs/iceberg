actions - repositories list
fetchAllRepositories
	^ GLMGenericAction new 
		action: [ self doFetchAllRepositories ];
		icon: GLMUIThemeExtraIcons glamorousLeftSide;
		shortcut: $F;
		title: 'Fetch all'; showTitle
		