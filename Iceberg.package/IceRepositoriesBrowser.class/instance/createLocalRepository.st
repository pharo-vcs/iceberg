actions - repositories list
createLocalRepository
	^ GLMGenericAction new
		action: [ :presentation | self class importLocalRepository ifNotNil: [ presentation pane ]];
		icon: (Smalltalk ui icons iconNamed: #packageAdd);
		shortcut: $a;
		title: 'Add local repository'; showTitle