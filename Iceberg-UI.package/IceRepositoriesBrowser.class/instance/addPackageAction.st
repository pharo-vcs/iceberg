actions - package
addPackageAction
	^ GLMGenericAction new
		action: [ :presentation :repo | 
			self class addPackageToRepository: repo repository.
			presentation update ];
		icon: #add asIcon;
		shortcut: $a;
		title: 'Add package'; showTitle