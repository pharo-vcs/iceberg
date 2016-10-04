action creators
forgetRepositoryAction
	^ GLMGenericAction new
		action: [ :presentation | 
			self 
				forgetRepository: presentation selection repository
				updating: presentation pane browser ];
		shortcut: $x; 
		title: 'Forget repository...'; 
		showTitle;
		yourself
