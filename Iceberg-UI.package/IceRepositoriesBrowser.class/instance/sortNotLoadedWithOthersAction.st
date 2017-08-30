menu actions - sorting
sortNotLoadedWithOthersAction
	^ GLMGenericAction new
		action: [ :presenter | 
			self sortingStrategy withOthers: #notLoaded.
			presenter update ];
		category: 'Sort not loaded';
		showTitle: 'With other packages';
		yourself