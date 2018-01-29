accessing
repositoryActionsFor: aRepository 

	^ {
		GLMGenericAction new
			action: [ :presentation | 
				presentation selection repository inspect ];
			category: 'Debugging';
			showTitle: 'Inspect repository'; 
			yourself }
