menu actions - sorting
sortNotLoadedFirstAction
	^ GLMGenericAction new
		action: [ :presenter | 
			self sortingStrategy first: #notLoaded.
			presenter update ];
		category: 'Sort not loaded';
		showTitle: 'First';
		yourself