menu actions - repositories list
newRepository
	^ GLMGenericAction new
		action: [ :presentation | self doNewRepository ];
		icon: #smallNew asIcon;
		shortcut: $n;
		title: 'New repository'; showTitle