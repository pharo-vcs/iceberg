actions - selected repository
addRemote
	^ GLMGenericAction new
		selectionAction: #addRemote;
		selectionCondition: #isOperative;
		showTitle: 'Add remote...'; 
		yourself
