menu actions - sorting
sortModifiedFirstAction
	^ GLMGenericAction new
		action: [ :presenter | 
			self sortingStrategy first: #modified.
			presenter update ];
		category: 'Sort modified';
		showTitle: 'First';
		yourself