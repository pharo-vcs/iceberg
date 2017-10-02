menu actions - sorting
sortModifiedWithOthersAction
	^ GLMGenericAction new
		action: [ :presenter | 
			self sortingStrategy withOthers: #modified.
			presenter update ];
		category: 'Sort modified';
		showTitle: 'With other packages';
		yourself