menu actions - sorting
sortModifiedLastAction
	^ GLMGenericAction new
		action: [ :presenter | 
			self sortingStrategy last: #modified.
			presenter update ];
		category: 'Sort modified';
		showTitle: 'Last';
		yourself