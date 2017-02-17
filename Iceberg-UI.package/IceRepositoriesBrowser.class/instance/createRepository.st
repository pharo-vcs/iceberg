actions - repositories list
createRepository
	^ GLMGenericAction new
		action: [ :presentation | self class createRepository];
		icon: #add asIcon;
		shortcut: $c;
		title: 'Clone new repository'; showTitle