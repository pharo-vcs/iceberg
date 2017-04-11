menu actions - package
unloadAndRemovePackageAction
	^ GLMGenericAction new
		action: [ :presentation | 
			presentation selection 
				unload;
				removeFromDisk.
			presentation update ]; 
		icon: #smallDelete asIcon;
		title: 'Unload & remove package from disk'; 
		condition: [ :presentation | 
			presentation selection notNil and: [ presentation selection isLoaded ] ];
		yourself

