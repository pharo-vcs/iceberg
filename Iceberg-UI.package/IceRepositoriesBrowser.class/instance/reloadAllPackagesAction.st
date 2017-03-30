menu actions - package
reloadAllPackagesAction
	^ GLMGenericAction new
		action: [ :presentation :repo | 
			repo entity savedPackages select: #isLoaded thenDo: [ :each | each reload ].
			presentation update ];
		icon: #refresh asIcon;
		shortcut: $e;
		title: 'Reload all'; showTitle