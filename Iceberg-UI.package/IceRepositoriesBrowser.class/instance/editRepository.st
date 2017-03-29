menu actions - selected repository
editRepository
	^ GLMGenericAction new
		action: [ :presentation | 
			presentation selection editRepositoryThen: [
				presentation pane browser pane update ] ];
		showTitle: 'Edit repository...';
		shortcut: $e;
		yourself