actions - selected repository
forgetRepository
	^ GLMGenericAction new
		selectionAction: #forget;
		showTitle: 'Forget repository...'; 
		shortcut: $x; 
		yourself
