building
composeNotValidIn: composite
	composite actionList
		title: [ :repo | 'Repository {1} is invalid.' format: { repo descriptionText } ];
		beVertical;
		act: [ :presentation :model | 
			model editRepositoryThen: [ 
				presentation pane browser update ]  ] entitled: 'Edit...';
		act: [ :presentation :model | model forget ] entitled: 'Forget'