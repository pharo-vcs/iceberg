menu actions - selected repository
fetchAction
	^ GLMGenericAction new
		action: [ :presentation | 
			presentation selection fetch.
			presentation update ];
		selectionCondition: #isOperative;
		icon: #glamorousLeftSide asIcon;
		showTitle: 'Fetch incoming commits';
		yourself