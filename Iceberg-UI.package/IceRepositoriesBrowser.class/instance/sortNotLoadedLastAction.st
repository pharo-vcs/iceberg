menu actions - sorting
sortNotLoadedLastAction
	^ GLMGenericAction new
		action: [ :presenter | 
			self sortingStrategy last: #notLoaded.
			presenter update ];
		category: 'Sort not loaded';
		showTitle: 'Last';
		yourself