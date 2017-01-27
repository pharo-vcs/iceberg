actions - repositories list
createLocalRepository
	^ GLMGenericAction new
		action: [ :presentation | self class importLocalRepository ifNotNil: [ presentation pane ]];
		icon: #packageAdd asIcon;
		shortcut: $a;
		title: 'Add local repository'; showTitle