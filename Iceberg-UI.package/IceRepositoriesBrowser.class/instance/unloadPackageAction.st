actions - package
unloadPackageAction
	^ GLMGenericAction new
		action: [ :presentation | 
			presentation selection unload.
			presentation update ]; 
		icon: (Smalltalk ui icons iconNamed: #delete);
		shortcut: $u; 
		title: 'Unload package'; 
		condition: [ :presentation | presentation selection notNil and: [ presentation selection isLoaded ]];
		yourself

