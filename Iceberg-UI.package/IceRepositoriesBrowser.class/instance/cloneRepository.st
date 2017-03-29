menu actions - repositories list
cloneRepository
	^ GLMGenericAction new
		action: [ self doCloneRepository ];
		icon: #add asIcon;
		shortcut: $c;
		title: 'Clone repository'; showTitle