actions - package
addPackageAction
	^ GLMGenericAction new
		action: [ :presentation :repo | 
			self class addPackageToRepository: repo.
			presentation update ];
		icon: GLMUIThemeExtraIcons glamorousAdd;
		shortcut: $a;
		title: 'Add package'; showTitle