menu actions - repositories list
addLocalRepository
	^ GLMGenericAction new
		action: [ self doAddLocalRepository ];
		icon: #packageAdd asIcon;
		shortcut: $a;
		title: 'Add local repository'; showTitle